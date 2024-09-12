require "digest/sha1"
require "zlib"

require_relative "./blob"

TEMP_CHARS = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a

class Database
  def initialize(pathname)
    @pathname = pathname
  end

  def store(object)
    string = object.to_s.force_encoding(Encoding::ASCII_8BIT)
    content = "#{object.type} #{string.bytesize}\0#{string}"
    object.oid = Digest::SHA1.hexdigest(content)
    write_object(object.oid, content)
  end

  private

  def write_object(oid, content)
    # 1.Constructs the path for the object using the first two characters of the oid as a directory.
    # 2.Creates a temporary file in the target directory.
    # 3.Compresses the content using Zlib.
    # 4.Writes the compressed content to the temporary file.
    # 5.Renames the temporary file to the final object path.
    object_path = @pathname.join(oid[0..1], oid[2..-1]) # final destination path that the blob will be written to
    dirname = object_path.dirname
    temp_path = dirname.join(generate_temp_name)
    begin
      # RDWR means the file is opened for reading and writing
      # CREAT means the operating system will attempt to create the file if it does not already exist.
      # EXCL is used in conjunction with CREAT and it means an error will be thrown if the file already exists;
      # this ensures our random filename won’t clobber another one if their names happen to coincide.
      flags = File::RDWR | File::CREAT | File::EXCL
      file = File.open(temp_path, flags)
    rescue Errno::ENOENT
      Dir.mkdir(dirname)
      file = File.open(temp_path, flags)
    end
    compressed = Zlib::Deflate.deflate(content, Zlib::BEST_SPEED)
    file.write(compressed)
    file.close
    File.rename(temp_path, object_path) # avoid partial writes
  end

  def generate_temp_name
    "tmp_obj_#{(1..6).map { TEMP_CHARS.sample }.join("")}"
  end
end

class Workspace
  IGNORE = [".", "..", ".git"]

  def initialize(root_path)
    @root_path = root_path
  end

  def list_files
    Dir.entries(@root_path) - IGNORE
  end

  def read_file(path)
    File.read(@root_path.join(path))
  end
end

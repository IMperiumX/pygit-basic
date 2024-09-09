require "fileutils"
require "pathname"

command = ARGV.shift

case command
when "init"
  path = ARGV.fetch(0, Dir.getwd)
  root_path = Pathname.new(File.expand_path(path))
  git_path = root_path.join(".git")
  ["objects", "refs"].each do |dir|
    begin
      FileUtils.mkdir_p(git_path.join(dir))
    rescue Errno::EACCES => error
      $stderr.puts "fatal: #{error.message}"
      exit 1
    end
  end
  puts "Initialized empty Git repository in #{git_path}"
  exit 0
else
  $stderr.puts "Git: '#{command}' is not a Git command."
  exit 1
end

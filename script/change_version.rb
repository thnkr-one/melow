require 'optparse'

def update_migration_version(directory, from_version, to_version)
  migration_files = Dir.glob(File.join(directory, "*_*.rb"))

  migration_files.each do |file_path|
    content = File.read(file_path)

    if content.gsub!(/ActiveRecord::Migration\[#{Regexp.escape(from_version)}\]/, "ActiveRecord::Migration[#{to_version}]")
      File.write(file_path, content)
      puts "Updated: #{File.basename(file_path)}"
    else
      puts "Skipped: #{File.basename(file_path)} (no changes needed)"
    end
  end
end

options = {
  from_version: '7.2',
  to_version: '8.0',
  directory: File.expand_path('db/migrate', Dir.pwd)
}

OptionParser.new do |opts|
  opts.banner = "Usage: ruby change_version.rb [options] [TARGET_VERSION]"

  opts.on("-d", "--directory DIR", "Directory containing migration files") do |dir|
    options[:directory] = dir
  end

  opts.on("-f", "--from VERSION", "Source version (default: 7.2)") do |version|
    options[:from_version] = version
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!

# Allow specifying the target version as a command-line argument
options[:to_version] = ARGV[0] if ARGV[0]

puts "Updating migration files in: #{options[:directory]}"
puts "Changing version from #{options[:from_version]} to #{options[:to_version]}"
update_migration_version(options[:directory], options[:from_version], options[:to_version])
puts "Migration version update complete."
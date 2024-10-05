require 'date'
require 'fileutils'
require 'optparse'

def copy_and_rename_migrations(source_dir, destination_dir, start_timestamp)
  current_time = DateTime.strptime(start_timestamp, "%Y%m%d%H%M%S").to_time

  migration_files = Dir.glob(File.join(source_dir, "[0-9]*_*.rb")).sort

  migration_files.each do |file_path|
    filename = File.basename(file_path)
    new_timestamp = current_time.strftime("%Y%m%d%H%M%S")
    new_filename = "#{new_timestamp}#{filename[14..-1]}"
    new_file_path = File.join(destination_dir, new_filename)

    FileUtils.cp(file_path, new_file_path)
    puts "Copied and renamed: #{filename} -> #{new_filename}"

    current_time += 3
  end
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby migrate_old.rb [options]"

  opts.on("-s", "--source-dir DIR", "Source directory of old migrations") do |dir|
    options[:source_dir] = dir
  end

  opts.on("-d", "--dest-dir DIR", "Destination directory in new project") do |dir|
    options[:dest_dir] = dir
  end

  opts.on("-t", "--start-timestamp TIMESTAMP", "Starting timestamp (default: 20241004001402)") do |timestamp|
    options[:start_timestamp] = timestamp
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!

options[:source_dir] ||= File.expand_path('~/db/migrate')
options[:dest_dir] ||= File.expand_path('db/migrate', Dir.pwd)
options[:start_timestamp] ||= "20241004001402"

copy_and_rename_migrations(options[:source_dir], options[:dest_dir], options[:start_timestamp])

puts "\nMigration files have been copied and renamed from:"
puts "  #{options[:source_dir]}"
puts "to:"
puts "  #{options[:dest_dir]}"
puts "\nPlease review the changes in your new project directory."
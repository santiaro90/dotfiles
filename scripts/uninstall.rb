require 'fileutils'
require 'yaml'

# Load config file and take links section
config = YAML.load_file('config.yaml')

links = config.find { |config_item| config_item.key?('link') }['link']

non_deletable = []

# Just need to grab the symlink path, not the file which the link poits to
links.each_key do |link|
  # Take dirname and file name
  dir, file = link.split('/')

  # Build absolute path to potentially remove the link
  del_path = "#{ENV['HOME']}/#{file}"

  # Just check links which exist in HOME
  if dir == '~'
    puts "Removing #{del_path}..." if File.exist?(del_path)
    # Check whether it is a file or directory
    if File.file?(del_path)
      FileUtils.rm(del_path)
    elsif File.directory?(del_path)
      FileUtils.rm_rf(del_path)
    end
  else
    non_deletable << link
  end
end

if non_deletable.any?
  puts "\ndotfiles: the following links could not or do not need to be deleted:"
  non_deletable.each { |file| puts file }
end

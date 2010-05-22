# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'


task :process_images, :location_input, :needs => :environment do |t, args| 
  # the logos are in a folder with path logos_dir
  Dir.glob(File.join("public/images/assets",'*')).each do |logo_path|
    if File.basename(logo_path)[0]!= '.' and !File.directory? logo_path
      asset = Asset.new
      asset.location_id = args.location_input
      asset.name = 'No Name'
      asset.format = 1
      asset.scans_attributes = [ { :data => File.new(logo_path) } ]
      asset.save
      puts "Processed asset #{asset.id}"
    end
  end
  puts "***** Finished! *****"
end



 
 


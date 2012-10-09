require 'find'
require 'fileutils'

namespace :cute_captcha do
  
  desc "example gem rake task"
  task :report => :environment do
    puts "you just ran the example gem rake task"
  end



  desc "seed database with included images"
  task :initialize_captchas => :environment do
    dir = File.join(File.dirname(__FILE__), "/../../included_assets/cute_captcha/" )
    item_type = nil
 #   file_dest_path = File.expand_path( '../public/images', Rails.root.basename ) + "/cc_i" 

    CuteCaptchaItem.delete_all
    
 #   Dir.mkdir( file_dest_path )
    Pathname(dir).each_child do |path|
      if FileTest.directory?(path) && ( ! File.basename( path ).start_with?( "." ) )
      
        puts("folder name is %s" % File.basename(path) )
        item_type = File.basename(path).upcase
        Pathname(path).each_child do |file_path|
          if( ! File.basename( file_path ).start_with?( "." ) )
#            new_name = "cc_avatar_%s.jpg" % SecureRandom.hex(10)
#            new_path = '%s/%s' % [file_dest_path, new_name]
#            copy_file file_path, new_path

            f = File.open(file_path)
            my_item = CuteCaptchaItem.create( :im_type => item_type, :avatar => f )
            f.close
          
          end
        end
      end
    end
  end

end
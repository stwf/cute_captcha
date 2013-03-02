require 'find'
require 'fileutils'

namespace :cute_captcha do
  
  desc "example gem rake task"
  task :report => :environment do
    puts "you just ran the example gem rake task"
  end



  desc "seed database with included images"
  task :seed => :environment do
    dir = File.join(File.dirname(__FILE__), "/../included_assets/cute_captcha/" )
    item_type = nil

    CuteCaptcha::CuteCaptchaItem.delete_all
    
    Pathname(dir).each_child do |path|
      if FileTest.directory?(path) && ( ! File.basename( path ).start_with?( "." ) )
      
        puts("folder name is %s" % File.basename(path) )
        item_type = File.basename(path).upcase
        Pathname(path).each_child do |file_path|
          if( ! File.basename( file_path ).start_with?( "." ) )
            f = File.open(file_path)
            my_item = CuteCaptcha::CuteCaptchaItem.create( :im_type => item_type, :avatar => f )
            f.close
          end
        end
      end
    end
  end

end
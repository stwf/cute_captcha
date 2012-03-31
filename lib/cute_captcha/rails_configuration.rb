
module CuteCapcha

  # Author: Lenny Marks
  # Date: 15Jun2009
  #
  # This class puts all the default config customizations for our
  # environment into one place.
  #
  class RailsConfiguration

    def self.customize(config, options = {})
      options = {
        :preload_patterns => []
      }.merge(options)
 
      config.logger = Logger.new(STDOUT) unless RAILS_ENV == 'test'
      if RAILS_ENV == 'production'
        config.logger.level = Logger::ERROR
      end
          
      # http://guides.rubyonrails.org/configuring.html
      #
      # Threadsafe operation is incompatible with the normal workings of development mode Rails.
      # In particular, automatic dependency loading and class reloading are automatically disabled
      # when you call config.threadsafe!.
      #
      # Avoid differences between production deploy(i.e. threadsafe) and development
      config.dependency_loading = false
      
      config.eager_load_paths << Rails.root.join('lib')
      
      # dependency loading is disabled when explicitly turned off and cache_classes=true
      # when dependency loading is disabled, pre-load common things to avoid
      # 'unitialized constant' errors   
      config.after_initialize do
        if config.cache_classes
#          require 'eop_model'
#          require 'eop_common'
        end
      end
      
      config.frameworks -= [ :active_record, :action_mailer, :active_resource ]

      config.time_zone = 'Eastern Time (US & Canada)'

      raise ":preload_pattern no longer supported. See: config.eager_load_paths" if options.has_key?(:preload_pattern)
    end

  end

end


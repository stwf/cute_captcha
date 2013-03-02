require 'cute_captcha'
require 'rails'


module CuteCaptcha
  class Railtie < Rails::Railtie

    config.to_prepare do
      CuteCaptcha.setup!
    end
  end

  def self.setup!

  end

end
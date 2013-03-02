require "cute_captcha/version"
require "active_support/dependencies"

module CuteCaptcha
	  mattr_accessor :app_root

  def self.setup
      yield self
  end

  class CuteCaptchaError < StandardError
  end
end


require 'cute_captcha/engine' if defined?(Rails)
require 'cute_captcha/railtie' if defined?(Rails)

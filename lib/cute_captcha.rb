module CuteCaptcha
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'application_controller'

  class CuteCaptchaError < StandardError
  end
end


Gem::Specification.new do |s|
  s.name = %q{cute_captcha}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Fuchs"]
  s.date = %q{2011-10-21}
  s.email = %q{steve@steveweb.com}
  s.files = [
    "app/controllers/cute_captcha_controller.rb",
    "app/views/_cute_captcha_view.haml",
    "config/routes.rb",
    "lib/application_controller.rb",
    "lib/application_helper.rb",
    "lib/cute_captcha.rb",
    "lib/cute_captcha/rails_configuration.rb",
    "lib/engine.rb",
    "lib/rails/railties/tasks.rb"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Description of your gem}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end


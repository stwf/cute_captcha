require 'rake/testtask'

Rake::TestTask.new do |test|
  test.pattern = 'test/**/*_test.rb'
  test.libs << 'test'
end


begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "cute_captcha"
    gem.summary = "Description of your gem"
    gem.email = "steve@steveweb.com"
    gem.authors = ["Steven Fuchs"]
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
  end
  Jeweler::GemcutterTasks.new

rescue
  puts "Jeweler or dependency not available."
end

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/core/testing_support/common_rake'

RSpec::Core::RakeTask.new

task :default => [:spec]

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_spreedly_subscribable_products'
  Rake::Task['common:test_app'].invoke
  `echo "\nrequire '../../config/pry_console_setup'" >> ./config/environments/development.rb`
  `echo "\nrequire '../../config/spreedly_api_config'" >> ./config/environments/development.rb`
  `echo "\nrequire '../../config/spreedly_api_config'" >> ./config/environments/test.rb`
end

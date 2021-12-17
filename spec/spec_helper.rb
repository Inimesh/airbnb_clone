# Set up testing environment
ENV['ENVIRONMENT'] = 'test'
# require_relative './construct_test_database'
# require_relative './deconstruct_test_database'
require_relative './setup_testing_database'
require_relative File.join(File.dirname(__FILE__), 'web_helper.rb')

# Configure Rspec
RSpec.configure do |config|

  # config.before(:each) do
  #   construct_test_database # could delete
  # end

  # config.after(:each) do
  #   deconstruct_test_database # use truncate instead, reset serial id
  # end

  config.before(:each) do
    truncate
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
  
end

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# require our Sinatra app file
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# tell Capybara about our app class
Capybara.app = MakersBnb

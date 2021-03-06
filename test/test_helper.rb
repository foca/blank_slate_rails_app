ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require "minitest/rails"

class MiniTest::Rails::ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all
end

# Require all support files.
Dir["#{Rails.root}/test/support/**/*.rb"].each { |file| require file }

silence_warnings do
  ::ActiveSupport::TestCase = MiniTest::Rails::ActiveSupport::TestCase
end

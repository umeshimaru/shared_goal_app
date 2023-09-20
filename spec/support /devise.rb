require 'rspec/rails' 

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :request
  config.include Devise::Test::ControllerHelpers, type: :view
end

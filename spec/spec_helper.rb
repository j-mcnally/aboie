$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'aboie'
require 'webmock/rspec'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.before(:example) do
    WebMock.disable_net_connect!

    Aboie.configure do |config|
    end
  end
end

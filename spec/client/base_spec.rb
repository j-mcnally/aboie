require 'spec_helper'

describe Aboie do
  context 'block configuration' do
    before(:example) do
      Aboie.configure do |config|
        config.api_key = "test123"
      end
    end
    after(:example) do
      Aboie.configure do |config|
        config.api_key = ""
      end
    end
    it "should allow email to be set" do
      expect(Aboie.configuration.api_key).to eq("test123")
    end

  end
end

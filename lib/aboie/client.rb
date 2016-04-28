module Aboie
  class Client
    attr_accessor :api_key
    def initialize(api_key=nil)
      self.api_key = api_key || Aboie.configuration.api_key
    end

    def send_text(who, msg)

      payload = {
        recipient: {id: who},
        message: {text: msg}
      }

      begin
        RestClient.post("https://graph.facebook.com/v2.6/me/messages?access_token=#{self.api_key}",
          payload.to_json,
          {accept: :json, content_type: :json}
        )
      rescue StandardError => e
        puts e.response.inspect
        puts e.response.body
        raise e
      end
    end

  end
end

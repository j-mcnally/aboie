module Aboie
  module Parser
    def parse_payload(payload)
      payload = Oj.load(payload) if payload.is_a?(String)
      messages = []
      payload["entry"].each do |entry|
        next if entry["messaging"].nil?
        entry["messaging"].each do |msg|
          messages.push({sender: msg["sender"]["id"], text: msg["message"]["text"]})
        end
      end
      messages
    end
  end
end

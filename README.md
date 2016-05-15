# Aboie


Aboie is a Framework for Facebook Messenger bots built with Ruby.

* Parses incomming message json into the commonly required parts (Sender) and (Message)
* Easily send text message responses via the Facebook Messenger API (Destination) & (Message)
* Support for Rich Media messages. (TODO)


### Why Aboie

Aboie is a french command when training dogs that means Speak or Bark.

## Getting Started:

This assumes you have read the facebook docs [https://developers.facebook.com/docs/messenger-platform](https://developers.facebook.com/docs/messenger-platform), and have created an api key.

### Installation:

Add

`gem 'aboie`

it

### Configuration:

Create an initializer with the following

```
	 Aboie.configure do |config|
	   config.api_key = "messenger_api_key"
	 end
```


### Parsing webhooks

Follow the instructions to setup an inbound webhook for the Messenger Api.
Aboie can help you parse through the large object and make sense of it.

```
module Webhooks
  class FacebooksController < ActionController::Base
    include Webhooks::Facebook::Verifiable

    def create
      messages = Aboie.parse_payload(params)
      message = messages.first
      query = message[:text]
      response = Chat::Brain.ask(query)
      Aboie.send_text(message[:sender], response)
      render nothing: true, status: :ok
    end

  end
end

```

Aboie.parse_payload(params) will parse the array of potential messages, into a simple array containing a hash with `{text: "Message", sender: "SenderId"}` this data can be used to formulate a response and respond to the proper sender id, using Aboie's easy message sending capabilities via `Aboie.send_text` which takes a `(sender_id, message)` as outlined in the example.




## Questions?  Issues?

For issues, please submit a Github issue with steps on how to reproduce the problem.


## Contributions

Contributions are welcome. Tests are encouraged.

To run tests / ensure your changes have not caused any regressions:

```
rspec
```

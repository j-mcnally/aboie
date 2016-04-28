require 'rest-client'
require 'oj'

require 'aboie/version'
require 'aboie/configuration/base'
require 'aboie/client'
require 'aboie/errors'
require 'aboie/parser'

module Aboie
  extend Configuration::Base
  extend Parser

  def self.default_client
    @@client ||= Aboie::Client.new
  end

  def self.method_missing(name, *args)
    self.default_client.send(name, *args)
  end

end

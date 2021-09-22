# frozen_string_literal: true

require "addressable/uri"
require "happymapper"

require_relative "ipgeobase/version"

module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip}")
    req = Net::HTTP.get_response(uri)

    HappyMapper.parse(req.body)
  end
end

require "net/http"
require "uri"
require "json"

# The Lisk API Ruby wrapper gem.
module Lisk

  # A simple HTTP client connecting to a Lisk Core API node.
  class Client

    # Host and port of the API endpoint.
    attr_accessor :host, :port, :ssl

    # Initializes the Lisk HTTP client and defaults to localhost port 8000.
    def initialize host = "127.0.0.1", port = 8000
      @host = host
      @port = port
      @ssl = false
      return self
    end

    # Allows reconfiguring of the Lisk HTTP client's host and port.
    def configure host, port
      if not host.empty? or not port.empty?
        @host = host
        @port = port
        @ssl = false
        return self
      else
        return nil
      end
    end

    # Handles GET requests to the given Lisk Core API endpoint
    def query_get endpoint
      if not @ssl
        # fixme "#{self}::#{__method__} Allow HTTPS requests"
        node = ::Net::HTTP.new @host, @port
        uri = URI.parse "http://#{host}:#{port}/api/#{endpoint}"
        request = ::Net::HTTP::Get.new uri
        response = node.request request
        result = JSON::parse response.body
      end
    end

    # Handles unimplemented methods
    def method_missing(name, *args, &block)
      todo "#{self}::#{name} METHOD MISSING"
    end

  end
end

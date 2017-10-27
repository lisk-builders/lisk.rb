require "net/http"
require "uri"
require "json"

# The Lisk API Ruby wrapper gem.
module Lisk

  # A simple HTTP client connecting to a Lisk Core API node.
  class Client

    # Host and port of the API endpoint.
    attr_accessor :host, :port, :ssl

    # Initializes the Lisk HTTP client and defaults to localhost port 7000.
    def initialize host = "127.0.0.1", port = 7000
      @host = host
      @port = port
      @ssl = false
      if self.is_alive?
        return self
      else
        return nil
      end
    end

    # Allows reconfiguring of the Lisk HTTP client's host and port.
    def configure host, port
      if not host.empty? or not port.empty?
        @host = host
        @port = port
        @ssl = false
        if self.is_alive?
          return self
        else
          return nil
        end
      else
        return nil
      end
    end

    # Get the status of last received block.
    # Returns true if block was received in the past 120 seconds.
    def is_alive?
      connected = self.query_get "loader/status/ping"
      connected["success"]
    end

    # Handles GET requests to the given Lisk Core API endpoint
    def query_get endpoint, params = nil
      if not @ssl
        # fixme "#{self}::#{__method__} Allow HTTPS requests"
        begin
          node = ::Net::HTTP.new @host, @port
          uri = URI.parse "http://#{host}:#{port}/api/#{endpoint}"
          if not params.nil?
            uri.query = URI.encode_www_form params
          end
          request = ::Net::HTTP::Get.new uri
          response = node.request request
          result = JSON::parse response.body
        rescue Timeout::Error => e
          p "Can't connect to the Lisk node: Timeout!"
        rescue Errno::EHOSTUNREACH => e
          p "Can't connect to the Lisk node: Host Unreachable!"
        rescue Errno::ECONNREFUSED => e
          p "Can't connect to the Lisk node: Connection Refused!"
        end
      end
    end

    # Handles POST requests to the given Lisk Core API endpoint
    def query_post endpoint, params
      if not @ssl
        # fixme "#{self}::#{__method__} Allow HTTPS requests"
        begin
          node = ::Net::HTTP.new @host, @port
          header = {'Content-Type': 'application/json'}
          uri = URI.parse "http://#{host}:#{port}/api/#{endpoint}"
          request = ::Net::HTTP::Post.new uri, header
          request.body = params.to_json
          response = node.request request
          result = JSON::parse response.body
        rescue Timeout::Error => e
          p "Can't connect to the Lisk node: Timeout!"
        rescue Errno::EHOSTUNREACH => e
          p "Can't connect to the Lisk node: Host Unreachable!"
        rescue Errno::ECONNREFUSED => e
          p "Can't connect to the Lisk node: Connection Refused!"
        end
      end
    end

    # Handles PUT requests to the given Lisk Core API endpoint
    def query_put endpoint, params
      if not @ssl
        # fixme "#{self}::#{__method__} Allow HTTPS requests"
        begin
          node = ::Net::HTTP.new @host, @port
          header = {'Content-Type': 'application/json'}
          uri = URI.parse "http://#{host}:#{port}/api/#{endpoint}"
          uri.query = URI.encode_www_form params
          request = ::Net::HTTP::Put.new uri, header
          request.body = params.to_json
          response = node.request request
          result = JSON::parse response.body
        rescue Timeout::Error => e
          p "Can't connect to the Lisk node: Timeout!"
        rescue Errno::EHOSTUNREACH => e
          p "Can't connect to the Lisk node: Host Unreachable!"
        rescue Errno::ECONNREFUSED => e
          p "Can't connect to the Lisk node: Connection Refused!"
        end
      end
    end

    # Handles unimplemented methods
    def method_missing name, *args, &block
      todo "#{self}::#{name} METHOD MISSING"
    end

  end
end

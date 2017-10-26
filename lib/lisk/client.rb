require "net/http"
require "uri"
require "json"

module Lisk
  class Client

    attr_accessor :host, :port

    def initialize host = "127.0.0.1", port = 8000
      @host = host
      @port = port
    end

    def configure host, port
      if not host.empty? or not port.empty?
        @host = host
        @port = port
      end
    end

    def query endpoint
      node = ::Net::HTTP.new @host, @port
      uri = URI.parse "http://#{host}:#{port}/api/#{endpoint}"
      request = ::Net::HTTP::Get.new uri
      response = node.request request
      result = JSON::parse response.body
    end

    # Get the status of last received block.
    # Returns true if block was received in the past 120 seconds.
    def ping
      ping = self.query "loader/status/ping"
      ping["success"]
    end

    # Returns the sync status of the blockchain.
    def status
      status = self.query "loader/status"
    end

    # Get the synchronization status of the client.
    def sync
      sync = self.query "loader/status/sync"
    end

    # Gets list of peers.
    def peers
      peers = self.query "peers"
      if peers["success"]
        return peers["peers"]
      else
        return peers
      end
    end

    # Gets version and build time.
    def version
      version = self.query "peers/version"
    end

    # Gets status of height, fee, milestone, blockreward and supply.
    def chain
      chain = self.query "blocks/getStatus"
    end

    # Unimplemented methods
    def method_missing(name, *args, &block)
      todo "#{self}::#{name} METHOD MISSING"
    end

  end
end

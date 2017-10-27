module Lisk
  class Legacy

    attr_accessor :client

    def initialize client
      @client = client
    end

    # Get the status of last received block.
    # Returns true if block was received in the past 120 seconds.
    def ping
      ping = @client.query_get "loader/status/ping"
      ping["success"]
    end

    # Returns the sync status of the blockchain.
    def status
      status = @client.query_get "loader/status"
    end

    # Get the synchronization status of the client.
    def sync
      sync = @client.query_get "loader/status/sync"
    end

    # Gets list of peers.
    def peers
      peers = @client.query_get "peers"
      if peers["success"]
        return peers["peers"]
      else
        return peers
      end
    end

    # Gets version and build time.
    def version
      version = @client.query_get "peers/version"
    end

    # Gets status of height, fee, milestone, blockreward and supply.
    def chain
      chain = @client.query_get "blocks/getStatus"
    end

    # Unimplemented methods
    def method_missing(name, *args, &block)
      todo "#{self}::#{name} METHOD MISSING"
    end

  end
end

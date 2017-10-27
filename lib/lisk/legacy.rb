# The Lisk API Ruby wrapper gem.
module Lisk

  # Implements legacy APIs of the Lisk Core pre-1.0.0 node
  class Legacy

    # A "lisk/client" connecting to a Lisk Core API node.
    attr_accessor :client

    # Initializing the legacy API with a legacy Lisk Core API client.
    def initialize client
      if not client.nil?
        @client = client
        return self
      else
        return nil
      end
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
        return nil
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

    # Gets delegate by username.
    def delegates_get_by_name user_name
      params = { :username => user_name }
      delegate = @client.query_get "delegates/get", params
      if delegate["success"]
        return delegate["delegate"]
      else
        return nil
      end
    end

    # Gets delegate by public key.
    def delegates_get_by_key public_key
      params = { :publicKey => public_key }
      delegate = @client.query_get "delegates/get", params
      if delegate["success"]
        return delegate["delegate"]
      else
        return nil
      end
    end

    # Gets voters of delegate.
    def delegates_voters public_key
      params = { :publicKey => public_key }
      voters = @client.query_get "delegates/voters", params
      if voters["success"]
        return voters["accounts"]
      else
        return nil
      end
    end

    # Request the balance of an account.
    def accounts_get_balance address
      params = { :address => address }
      balance = @client.query_get "accounts/getBalance", params
    end

    # Handles unimplemented methods
    def method_missing(name, *args, &block)
      todo "#{self}::#{name} METHOD MISSING"
    end

  end
end

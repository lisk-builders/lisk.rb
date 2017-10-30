# The Lisk API Ruby wrapper gem.
module Lisk

  # Implements raw APIs of the Lisk Core node.
  class Raw

    # A "lisk/client" connecting to a Lisk Core API node.
    attr_accessor :client

    # Initializing the API with a Lisk Core API client.
    def initialize client
      if not client.nil?
        @client = client
        return self
      else
        return nil
      end
    end

    #############################################
    # https://github.com/4fryn/lisk.rb/issues/1 #
    #############################################

    # The "accounts" API
    def accounts
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "blocks" API
    def blocks
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "dapps" API
    def dapps
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "delegates" API
    def delegates
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "delegates/forgers" API
    def delegates_forgers
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "delegates/forging" API
    def delegates_forging
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "node/constants" API
    def node_constants
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "node/status" API
    def node_status
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "peers" API
    def peers
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "signatures" API
    def signatures
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "transactions" API
    def transactions
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "transactions/unsigned" API
    def transactions_unsigned
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "transactions/unconfirmed" API
    def transactions_unconfirmed
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "transactions/unprocessed" API
    def transactions_unprocessed
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "votes" API
    def votes
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "voters" API
    def voters
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "accounts" API
    def accounts
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "blocks" API
    def blocks
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "dapps" API
    def dapps
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "delegates" API
    def delegates
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "delegates/forgers" API
    def delegates_forgers
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "delegates/forging" API
    def delegates_forging
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "node/constants" API
    def node_constants
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "node/status" API
    def node_status
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "peers" API
    def peers
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "signatures" API
    def signatures
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "transactions" API
    def transactions
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "transactions/unsigned" API
    def transactions_unsigned
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "transactions/unconfirmed" API
    def transactions_unconfirmed
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "transactions/unprocessed" API
    def transactions_unprocessed
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "votes" API
    def votes
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # The "voters" API
    def voters
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # Handles unimplemented methods
    def method_missing name, *args, &block
      todo "#{self}::#{name} METHOD MISSING"
    end

  end
end

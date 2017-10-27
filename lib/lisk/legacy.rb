# The Lisk API Ruby wrapper gem.
module Lisk

  # Implements legacy APIs of the Lisk Core pre-1.0.0 node.
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

    #############################################
    # https://github.com/4fryn/lisk.rb/issues/4 #
    #############################################

    ### `POST /accounts/open`
    def accounts_open
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # Request the balance of an account.
    # `GET /accounts/getBalance?address=address`
    def accounts_get_balance address
      params = { :address => address }
      balance = @client.query_get "accounts/getBalance", params
    end

    ### `GET /accounts/getPublicKey?address=address`
    def accounts_get_public_key address
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `POST /accounts/generatePublicKey`
    def accounts_generate_public_key
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /accounts?address=address`
    def accounts address
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /accounts/delegates?address=address`
    def accounts_delegates_get_by_address address
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `PUT /accounts/delegates`
    def accounts_delegates_put
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # Get the synchronization status of the client.
    # `GET /loader/status`
    def loader_status_sync
      sync = @client.query_get "loader/status/sync"
    end

    # Returns the sync status of the blockchain.
    # `GET /loader/status/sync`
    def loader_status
      status = @client.query_get "loader/status"
    end

    # Get the status of last received block.
    # Returns true if block was received in the past 120 seconds.
    # `GET /loader/status/ping`
    def loader_status_ping
      ping = @client.query_get "loader/status/ping"
      ping["success"]
    end

    ### `GET /transactions?blockId=blockId&senderId=senderId&recipientId=recipientId&limit=limit&offset=offset&orderBy=field`
    def transactions filter
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `PUT /transactions`
    def transactions_put
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /transactions/get?id=id`
    def transactions_get_by_id id
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /transactions/unconfirmed/get?id=id`
    def transactions_unconfirmed_get_by_id id
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /transactions/unconfirmed`
    def transactions_unconfirmed
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /transactions/queued`
    def transactions_queued
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /transactions/queued/get?id=id`
    def transactions_queued_get_by_id id
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # Gets list of peers.
    # `GET /peers?state=state&os=os&version=version&limit=limit&offset=offset&orderBy=orderBy`
    def peers filter = nil
      peers = @client.query_get "peers", filter
      if peers["success"]
        return peers["peers"]
      else
        return nil
      end
    end

    ### `GET /peers/get?ip=ip&port=port`
    def peers_get filter
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end


    # Gets version and build time.
    # `GET /peers/version`
    def peers_version
      version = @client.query_get "peers/version"
    end

    ### `GET /blocks?generatorPublicKey=generatorPublicKey&height=height&previousBlock=previousBlock&totalAmount=totalAmount&totalFee=totalFee&limit=limit&offset=offset&orderBy=orderBy`
    def blocks filter
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /blocks/get?id=id`
    def blocks_get_by_id id
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /blocks/getFee`
    def blocks_get_fee
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /blocks/getFees`
    def blocks_get_fees
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /blocks/getReward`
    def blocks_get_reward
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /blocks/getSupply`
    def blocks_get_supply
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /blocks/getHeight`
    def blocks_get_height
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # Gets status of height, fee, milestone, blockreward and supply.
    # `GET /blocks/getStatus`
    def blocks_get_status
      chain = @client.query_get "blocks/getStatus"
    end

    ### `GET /blocks/getNethash`
    def blocks_get_nethash
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /blocks/getMilestone`
    def blocks_get_milestone
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /signatures/fee`
    def signatures_fee
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `PUT /signatures`
    def signatures_put
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `PUT /delegates`
    def delegates_put
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /delegates?limit=limit&offset=offset&orderBy=orderBy`
    def delegates filter
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # Gets delegate by public key.
    # `GET /delegates/get?publicKey=publicKey`
    def delegates_get_by_key public_key
      params = { :publicKey => public_key }
      delegate = @client.query_get "delegates/get", params
      if delegate["success"]
        return delegate["delegate"]
      else
        return nil
      end
    end

    # Gets delegate by username.
    # `GET /delegates/get?username=username`
    def delegates_get_by_name user_name
      params = { :username => user_name }
      delegate = @client.query_get "delegates/get", params
      if delegate["success"]
        return delegate["delegate"]
      else
        return nil
      end
    end

    ### `GET /delegates/search?q=username&orderBy=producedblocks:desc`
    def delegates_search query
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /delegates/count`
    def delegates_count
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /accounts/delegates/?address=address`
    def accounts_delegates address
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end


    # Gets voters of delegate.
    # `GET /delegates/voters?publicKey=publicKey`
    def delegates_voters public_key
      params = { :publicKey => public_key }
      voters = @client.query_get "delegates/voters", params
      if voters["success"]
        return voters["accounts"]
      else
        return nil
      end
    end

    ### `POST /delegates/forging/enable`
    def delegates_forging_enable
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `POST /delegates/forging/disable`
    def delegates_forging_disable
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /delegates/forging/getForgedByAccount?generatorPublicKey=generatorPublicKey`
    def delegates_forging_get_forged_by_account public_key
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /delegates/getNextForgers?limit=limit`
    def delegates_get_next_forgers limit = 10
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `PUT /dapps`
    def dapps_put
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /dapps?category=category&name=name&type=type&link=link&limit=limit&offset=offset&orderBy=orderBy`
    def dapps filter
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /dapps/get?id=id`
    def dapps_get_by_id id
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /dapps/search?q=q&category=category&installed=installed`
    def dapps_search query
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `POST /dapps/install`
    def dapps_install
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /dapps/installed`
    def dapps_installed
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /dapps/installedIds`
    def dapps_installed_ids
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `POST /dapps/uninstall`
    def dapps_uninstall
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `POST /dapps/launch`
    def dapps_launch
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /dapps/installing`
    def dapps_installing
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /dapps/uninstalling`
    def dapps_uninstalling
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /dapps/launched`
    def dapps_launched
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /dapps/categories`
    def dapps_categories
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `POST /dapps/stop`
    def dapps_stop
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `PUT /multisignatures`
    def multisignatures_put
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /multisignatures/accounts?publicKey=publicKey`
    def multisignatures_accounts public_key
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `POST /multisignatures/sign`
    def multisignatures_sign
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    ### `GET /multisignatures/pending?publicKey=publicKey`
    def multisignatures_pending public_key
      todo "#{self}::#{__method__} UNIMPLEMENTED"
    end

    # Handles unimplemented methods
    def method_missing(name, *args, &block)
      todo "#{self}::#{name} METHOD MISSING"
    end

  end
end

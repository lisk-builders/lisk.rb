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

    # Request information about an account.
    # `POST /accounts/open`
    def accounts_open secret
      params = { :secret => secret }
      account = @client.query_post "accounts/open", params
      if account["success"]
        return account["account"]
      else
        return nil
      end
    end

    # Request the balance of an account.
    # `GET /accounts/getBalance?address=address`
    def accounts_get_balance address
      params = { :address => address }
      balance = @client.query_get "accounts/getBalance", params
    end

    # Get the public key of an account. If the account does not exist the API call will return an error.
    # `GET /accounts/getPublicKey?address=address`
    def accounts_get_public_key address
      params = { :address => address }
      public_key = @client.query_get "accounts/getPublicKey", params
    end

    # Returns the public key of the provided secret key.
    # `POST /accounts/generatePublicKey`
    def accounts_generate_public_key secret
      params = { :secret => secret }
      public_key = @client.query_post "accounts/generatePublicKey", params
    end

    # Returns account information of an address.
    # `GET /accounts?address=address`
    def accounts address
      params = { :address => address }
      account = @client.query_get "accounts", params
    end

    # Returns delegate vote accounts by address.
    # `GET /accounts/delegates?address=address`
    def accounts_delegates_get_by_address address
      params = { :address => address }
      delegate = @client.query_get "accounts/delegates", params
    end

    # Vote for the selected delegates. Maximum of 33 delegates at once.
    # `PUT /accounts/delegates`
    def accounts_delegates_put votes
      delegate = @client.query_put "accounts/delegates", votes
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
    end

    # List of transactions matched by provided parameters.
    # `GET /transactions?blockId=blockId&senderId=senderId&recipientId=recipientId&limit=limit&offset=offset&orderBy=field`
    def transactions filter = nil
      transactions = @client.query_get "transactions", filter
      if transactions["success"]
        return transactions["transactions"]
      else
        return nil
      end
    end

    ### `PUT /transactions`
    def transactions_put transaction
      transaction = @client.query_put "transactions", transaction
    end

    ### `GET /transactions/get?id=id`
    def transactions_get_by_id id
      params = { :id => id }
      transaction = @client.query_get "transactions/get", params
    end

    ### `GET /transactions/unconfirmed/get?id=id`
    def transactions_unconfirmed_get_by_id id
      params = { :id => id }
      transaction = @client.query_get "transactions/unconfirmed/get", params
    end

    ### `GET /transactions/unconfirmed`
    def transactions_unconfirmed
      transaction = @client.query_get "transactions/unconfirmed"
    end

    ### `GET /transactions/queued`
    def transactions_queued
      transaction = @client.query_get "transactions/queued"
    end

    ### `GET /transactions/queued/get?id=id`
    def transactions_queued_get_by_id id
      params = { :id => id }
      transaction = @client.query_get "transactions/queued/get", params
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
    def peers_get filter = nil
      peer = @client.query_get "peers/get", filter
    end

    # Gets version and build time.
    # `GET /peers/version`
    def peers_version
      version = @client.query_get "peers/version"
    end

    ### `GET /blocks?generatorPublicKey=generatorPublicKey&height=height&previousBlock=previousBlock&totalAmount=totalAmount&totalFee=totalFee&limit=limit&offset=offset&orderBy=orderBy`
    def blocks filter = nil
      blocks = @client.query_get "blocks", filter
      if blocks["success"]
        return blocks["blocks"]
      else
        return nil
      end
    end

    ### `GET /blocks/get?id=id`
    def blocks_get_by_id id
      params = { :id => id }
      block = @client.query_get "blocks/get", params
    end

    ### `GET /blocks/getFee`
    def blocks_get_fee
      fee = @client.query_get "blocks/getFee"
    end

    ### `GET /blocks/getFees`
    def blocks_get_fees
      fees = @client.query_get "blocks/getFees"
    end

    ### `GET /blocks/getReward`
    def blocks_get_reward
      reward = @client.query_get "blocks/getReward"
    end

    ### `GET /blocks/getSupply`
    def blocks_get_supply
      supply = @client.query_get "blocks/getSupply"
    end

    ### `GET /blocks/getHeight`
    def blocks_get_height
      height = @client.query_get "blocks/getHeight"
    end

    # Gets status of height, fee, milestone, blockreward and supply.
    # `GET /blocks/getStatus`
    def blocks_get_status
      status = @client.query_get "blocks/getStatus"
    end

    ### `GET /blocks/getNethash`
    def blocks_get_nethash
      nethash = @client.query_get "blocks/getNethash"
    end

    ### `GET /blocks/getMilestone`
    def blocks_get_milestone
      milestone = @client.query_get "blocks/getMilestone"
    end

    # Gets the second signature status of an account.
    # `GET /signatures/fee`
    def signatures_fee
      fee = @client.query_get "signatures/fee"
    end

    # Add a second signature to an account.
    # `PUT /signatures`
    def signatures_put secrets
      transaction = @client.query_put "signatures", secrets
    end

    # Puts request to create a delegate.
    # `PUT /delegates`
    def delegates_put delegate
      delegate = @client.query_put "delegates", delegate
    end

    # Gets list of delegates by provided filter.
    # `GET /delegates?limit=limit&offset=offset&orderBy=orderBy`
    def delegates filter = nil
      delegates = @client.query_get "delegates", filter
      if delegates["success"]
        return delegates["delegates"]
      else
        return nil
      end
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
      delegates = @client.query_get "delegates/search", query
      if delegates["success"]
        return delegates["delegates"]
      else
        return nil
      end
    end

    ### `GET /delegates/count`
    def delegates_count
      count = @client.query_get "delegates/count"
    end

    ### `GET /accounts/delegates/?address=address`
    def accounts_delegates address
      params = { :address => address }
      account = @client.query_get "accounts/delegates", params
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
    def delegates_forging_enable secret
      params = { :secret => secret }
      count = @client.query_post "delegates/forging/enable", params
    end

    ### `POST /delegates/forging/disable`
    def delegates_forging_disable secret
      params = { :secret => secret }
      count = @client.query_post "delegates/forging/disable", params
    end

    ### `GET /delegates/forging/getForgedByAccount?generatorPublicKey=generatorPublicKey`
    def delegates_forging_get_forged_by_account public_key
      params = { :generatorPublicKey => public_key }
      forged = @client.query_get "delegates/forging/getForgedByAccount", params
    end

    ### `GET /delegates/getNextForgers?limit=limit`
    def delegates_get_next_forgers limit = 10
      params = { :limit => limit }
      forgers = @client.query_get "delegates/getNextForgers", params
    end

    #############################################
    # https://github.com/4fryn/lisk.rb/issues/4 #
    #############################################

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

    #############################################

    # Create a multi-signature account.
    # `PUT /multisignatures`
    def multisignatures_put secrets
      transaction = @client.query_put "multisignatures", secrets
    end

    # Gets a list of accounts that belong to a multi-signature account.
    # `GET /multisignatures/accounts?publicKey=publicKey`
    def multisignatures_accounts public_key
      params = { :publicKey => public_key }
      accounts = @client.query_get "multisignatures/accounts", params
    end

    # Signs a transaction that is awaiting signature.
    # `POST /multisignatures/sign`
    def multisignatures_sign signature
      transaction = @client.query_post "multisignatures/sign", signature
    end

    # Returns a list of multi-signature transactions that waiting for signature by publicKey.
    # `GET /multisignatures/pending?publicKey=publicKey`
    def multisignatures_pending public_key
      params = { :publicKey => public_key }
      transactions = @client.query_get "multisignatures/pending", params
    end

    # Handles unimplemented methods
    def method_missing name, *args, &block
      todo "#{self}::#{name} METHOD MISSING"
    end

  end
end

require "time"

# The Lisk API Ruby wrapper gem.
module Lisk

  # Helper functions to wrap raw legacy APIs into meaningul methods.
  class API < Legacy

    # Returns true if chain is syncing.
    def is_syncing?
      synced = self.loader_status_sync
      if synced["success"]
        return synced["syncing"]
      else
        return nil
      end
    end

    # Returns true if chain is loaded.
    def is_chain_loaded?
      loaded = self.loader_status
      if loaded["success"]
        return loaded["loaded"]
      else
        return nil
      end
    end

    # Get the Lisk node version string.
    def get_version
      version = self.peers_version
      if version["success"]
        return version["version"]
      else
        return nil
      end
    end

    # Get the Lisk node version build date.
    def get_version_build
      version = self.peers_version
      if version["success"]
        return version["build"]
      else
        return nil
      end
    end

    # Get the Lisk node version commit.
    def get_version_commit
      version = self.peers_version
      if version["success"]
        return version["commit"]
      else
        return nil
      end
    end

    # Get the height of the local best known block.
    def get_best_block
      synced = self.loader_status_sync
      if synced["success"]
        return synced["height"]
      else
        return nil
      end
    end

    # Get the number of remaining local sync blocks.
    def get_remaining_blocks
      synced = self.loader_status_sync
      if synced["success"]
        return synced["blocks"]
      else
        return nil
      end
    end

    # Get the global best block in the network.
    def get_chain_best_block
      blocks = self.blocks_get_height
      if blocks["success"]
        return blocks["height"]
      else
        return nil
      end
    end

    # Get the broad hash.
    def get_broadhash
      blocks = self.blocks_get_status
      if blocks["success"]
        return blocks["broadhash"]
      else
        return nil
      end
    end

    # Get the net hash.
    def get_nethash
      blocks = self.blocks_get_nethash
      if blocks["success"]
        return blocks["nethash"]
      else
        return nil
      end
    end

    # Get the current epoch date.
    def get_epoch
      blocks = self.blocks_get_status
      if blocks["success"]
        epoch = Time.parse blocks["epoch"]
        return epoch
      else
        return nil
      end
    end

    # Get the current milestone.
    def get_milestone
      blocks = self.blocks_get_milestone
      if blocks["success"]
        return blocks["milestone"]
      else
        return nil
      end
    end

    # Get the current block reward.
    def get_block_reward
      blocks = self.blocks_get_reward
      if blocks["success"]
        return blocks["reward"]
      else
        return nil
      end
    end

    # Get the available supply.
    def get_available_supply
      blocks = self.blocks_get_supply
      if blocks["success"]
        return blocks["supply"]
      else
        return nil
      end
    end

    # Get fees for sending transactions
    def get_fee_send
      fee = self.blocks_get_fees
      if fee["success"]
        return fee["fees"]["send"]
      else
        return nil
      end
    end

    # Get fees for voting
    def get_fee_vote
      fee = self.blocks_get_fees
      if fee["success"]
        return fee["fees"]["vote"]
      else
        return nil
      end
    end

    # Get fees for second signatures
    def get_fee_secondsignature
      fee = self.blocks_get_fees
      if fee["success"]
        return fee["fees"]["secondsignature"]
      else
        return nil
      end
    end

    # Get fees for delegate registration
    def get_fee_delegate
      fee = self.blocks_get_fees
      if fee["success"]
        return fee["fees"]["delegate"]
      else
        return nil
      end
    end

    # Get fees for multisignature registration
    def get_fee_multisignature
      fee = self.blocks_get_fees
      if fee["success"]
        return fee["fees"]["multisignature"]
      else
        return nil
      end
    end

    # Get fees for dapps registration
    def get_fee_dapp
      fee = self.blocks_get_fees
      if fee["success"]
        return fee["fees"]["dapp"]
      else
        return nil
      end
    end

    # Get an array of all known peers.
    def get_peers
      peers = self.peers
    end

    # Get the number of all known peers.
    def get_peer_count
      peers = self.get_peers
      if not peers.nil?
        count = peers.count
      else
        count = 0
      end
    end

    # Get an array of all connected peers.
    def get_connected_peers
      filter_by_state = { :state => 2 }
      connected = self.peers filter_by_state
    end

    # Get an array of all disconnected peers.
    def get_disconnected_peers
      filter_by_state = { :state => 1 }
      disconnected = self.peers filter_by_state
    end

    # Get an array of all banned peers.
    def get_banned_peers
      filter_by_state = { :state => 0 }
      banned = self.peers filter_by_state
    end

    # Handles unimplemented methods
    def method_missing name, *args, &block
      todo "#{self}::#{name} METHOD MISSING"
    end

  end
end

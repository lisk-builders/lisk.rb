#!/usr/bin/env ruby

require 'lisk'

# Try to connect a local Lisk client
client = Lisk::Client.new

# Configure host and port of the Lisk client
client = client.configure "127.0.0.1", 8000

# Same as above, just in one line
client = Lisk::Client.new "127.0.0.1", 8000

# The pre-1.0.0 legacy API
legacy_api = Lisk::Legacy.new client

# Only proceed if the client is connected, active, and fully synchronized
if legacy_api.ping

  # Lisk version API example
  version = legacy_api.version
  p "Lisk node version #{version["version"]} build #{version["build"]}..."

  # Lisk node status API example
  status = legacy_api.status
  p "Lisk node is connected: #{status["success"]}... Blockchain loaded: #{status["loaded"]}..."

  # Lisk node syncing API example
  syncing = legacy_api.sync
  p "Lisk node is syncing: #{syncing["syncing"]}... #{syncing["blocks"]} remaining blocks to latest block #{syncing["height"]}..."

  # Lisk node peers API example
  peers = legacy_api.peers
  cond = 0
  disd = 0
  band = 0
  peers.each do | peer |
    case peer["state"]
    when 0
      band += 1
    when 1
      disd += 1
    when 2
      cond += 1
    end
  end
  p "Lisk node saw #{peers.count} peers... #{cond} connected, #{disd} disconnected, #{band} banned..."

  # Lisk blockchain API example
  chain = legacy_api.chain
  p "Lisk chain latest block: #{chain["height"]}... total supply: #{chain["supply"] / 1e8}... block reward: #{chain["reward"] / 1e8}"
else
  p 'Lisk node disconnected, inactive, or not fully synchronized ...'
end

#account = Lisk::Account.new("14524922419337843943L")
#client.get_address(account)
#block = Lisk::Block.new("11145685198263496703")
#delegate = Lisk::Delegate.new("lightcurve")
#client.get_address(delegate)
#client.get_voters(delegate)
#transaction = Lisk::Transaction.new("10153999325502978458")

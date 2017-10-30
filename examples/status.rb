#!/usr/bin/env ruby

require 'lisk'

# Try to connect a local Lisk client.
node = Lisk::Client.new

# Configure host and port of the Lisk client.
node = node.configure "127.0.0.1", 7000

# Same as above, just in one line, let's stick to test network for now.
node = Lisk::Client.new "127.0.0.1", 7000

# Only proceed if the client is connected, active, and fully synchronized.
if node.is_alive?

  # Lisk tools wraps the raw API in meaningful methods.
  lisk = Lisk::API.new node

  # Lisk version API example.
  version = lisk.get_version
  commit = lisk.get_version_commit
  build = lisk.get_version_build
  p "Lisk node version #{version} commit #{commit} build #{build}..."

  # Lisk node status API example.
  connected = node.is_alive?
  loaded = lisk.is_chain_loaded?
  p "Lisk node is connected: #{connected}... Blockchain loaded: #{loaded}..."

  # Lisk node syncing API example.
  synced = lisk.is_syncing?
  blocks = lisk.get_remaining_blocks
  height = lisk.get_best_block
  p "Lisk node is syncing: #{synced}... #{blocks} remaining blocks to latest block #{height}..."

  # Lisk node peers API example.
  cond = lisk.get_connected_peers.count
  disd = lisk.get_disconnected_peers.count
  band = lisk.get_banned_peers.count
  all = lisk.get_peer_count
  p "Lisk node saw #{all} peers... #{cond} connected, #{disd} disconnected, #{band} banned..."

  # Lisk blockchain API example.
  chain_height = lisk.get_chain_best_block
  block_reward = lisk.get_block_reward
  total_supply = lisk.get_available_supply
  p "Lisk chain latest block: #{chain_height}... total supply: #{total_supply / 1e8}... block reward: #{block_reward / 1e8}"

else
  p 'Lisk node disconnected, inactive, or not fully synchronized ...'
end

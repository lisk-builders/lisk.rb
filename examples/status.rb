#!/usr/bin/env ruby

require 'lisk'

# Try to connect a local Lisk client.
node = Lisk::Client.new

# Configure host and port of the Lisk client.
node = node.configure "127.0.0.1", 7000

# Same as above, just in one line, let's stick to test network for now.
node = Lisk::Client.new "127.0.0.1", 7000

# Lisk tools wraps the raw API in meaningful methods.
api = Lisk::API.new node

# Only proceed if the client is connected.
if node.is_alive? or api.is_syncing?

  # Lisk version API example.
  version = api.get_version
  commit = api.get_version_commit
  build = api.get_version_build
  p "Lisk node version #{version} commit #{commit} build #{build}..."

  # Lisk node status API example.
  connected = node.is_alive?
  loaded = api.is_chain_loaded?
  p "Lisk node is connected: #{connected}... Blockchain loaded: #{loaded}..."

  # Lisk node syncing API example.
  synced = api.is_syncing?
  blocks = api.get_remaining_blocks
  height = api.get_best_block
  p "Lisk node is syncing: #{synced}... #{blocks} remaining blocks to latest block #{height}..."

  # Lisk node peers API example.
  cond = api.get_connected_peers.count
  disd = api.get_disconnected_peers.count
  band = api.get_banned_peers.count
  all = api.get_peer_count
  p "Lisk node saw #{all} peers... #{cond} connected, #{disd} disconnected, #{band} banned..."

  # Lisk blockchain API example.
  chain_height = api.get_chain_best_block
  block_reward = api.get_block_reward
  total_supply = api.get_available_supply
  p "Lisk chain latest block: #{chain_height}... total supply: #{total_supply / 1e8}... block reward: #{block_reward / 1e8}"

else
  p 'Lisk node disconnected ...'
end

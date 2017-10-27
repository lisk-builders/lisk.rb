#!/usr/bin/env ruby

require 'lisk'

# Try to connect a local Lisk client on test network.
# Warning: Think twice and test thoroughly before enabling this on main network!
client = Lisk::Client.new "127.0.0.1", 7000

# The pre-1.0.0 legacy API connected to the client.
legacy_api = Lisk::Legacy.new client

# Testing legacy API against https://github.com/4fryn/lisk.rb/issues/4

new_account = legacy_api.accounts_open "lorem ipsum"
p new_account["address"]

### @TODO
# legacy_api.accounts_get_balance address
# legacy_api.accounts_get_public_key address
# legacy_api.accounts_generate_public_key
# legacy_api.accounts address
# legacy_api.accounts_delegates_get_by_address address
# legacy_api.accounts_delegates_put
# legacy_api.loader_status_sync
# legacy_api.loader_status
# legacy_api.loader_status_ping
# legacy_api.transactions filter
# legacy_api.transactions_put
# legacy_api.transactions_get_by_id id
# legacy_api.transactions_unconfirmed_get_by_id id
# legacy_api.transactions_unconfirmed
# legacy_api.transactions_queued
# legacy_api.transactions_queued_get_by_id id
# legacy_api.peers filter
# legacy_api.peers_get filter
# legacy_api.peers_version
# legacy_api.blocks filter
# legacy_api.blocks_get_by_id id
# legacy_api.blocks_get_fee
# legacy_api.blocks_get_fees
# legacy_api.blocks_get_reward
# legacy_api.blocks_get_supply
# legacy_api.blocks_get_height
# legacy_api.blocks_get_status
# legacy_api.blocks_get_nethash
# legacy_api.blocks_get_milestone
# legacy_api.signatures_fee
# legacy_api.signatures_put
# legacy_api.delegates_put
# legacy_api.delegates filter
# legacy_api.delegates_get_by_key public_key
# legacy_api.delegates_get_by_name user_name
# legacy_api.delegates_search query
# legacy_api.delegates_count
# legacy_api.accounts_delegates address
# legacy_api.delegates_voters public_key
# legacy_api.delegates_forging_enable
# legacy_api.delegates_forging_disable
# legacy_api.delegates_forging_get_forged_by_account public_key
# legacy_api.delegates_get_next_forgers limit
# legacy_api.dapps_put
# legacy_api.dapps filter
# legacy_api.dapps_get_by_id id
# legacy_api.dapps_search query
# legacy_api.dapps_install
# legacy_api.dapps_installed
# legacy_api.dapps_installed_ids
# legacy_api.dapps_uninstall
# legacy_api.dapps_launch
# legacy_api.dapps_installing
# legacy_api.dapps_uninstalling
# legacy_api.dapps_launched
# legacy_api.dapps_categories
# legacy_api.dapps_stop
# legacy_api.multisignatures_put
# legacy_api.multisignatures_accounts public_key
# legacy_api.multisignatures_sign
# legacy_api.multisignatures_pending public_key

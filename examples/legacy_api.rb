#!/usr/bin/env ruby

require 'lisk'

# Try to connect a local Lisk client on test network.
# Warning: Think twice and test thoroughly before enabling this on main network!
client = Lisk::Client.new "127.0.0.1", 7000
legacy_api = Lisk::Legacy.new client

# Test data
_user = "4fryn_lorem_ipsum_42"
_secret = "lorem ipsum dolor sit amet et semper aperiam est duo modus zril"
_second_secret = "amet aperiam dolor duo est et ipsum lorem modus semper sit zril"
_address = "6824694156543443160L"
_public_key = "add8d8e3e89183ac34cdfb2631e038c9b0c1e922aa9a67aba71e35aed511bcf1"
_votes = {
  :secret => _secret,
  :public_key => _public_key,
# :secondSecret => _second_secret,
  :delegates => [
    "+473c354cdf627b82e9113e02a337486dd3afc5615eb71ffd311c5a0beda37b8c",
    "+eaa049295d96618c51eb30deffe7fc2cc8bfc13190cb97f3b513dd060b000a46",
    "+961d1a1057a09f865291873e9ba3d0af7b2a3a1e971bb7576a2aab1c526acbcd",
    "+71e1e34dd0529d920ee6c38497b028352c57b7130d55737c8a778ff3974ec29f",
    "+3697a4f8c74cb21949eec31fddde190c16ab2497709fb503c567d3a9e6a6e989",
    "+3193057832bb1c9782a8e4a32e543b535ed9d750b1b10383f8b6f50853569609",
    "+fa7bfd3a2dc0ca55b700247aae4694709d6cdfa34c6bfb0237e032d7aae404f0",
    "+fc4f231b00f72ba93a4778890c5d2b89d3f570e606c04619a0343a3cdddf73c7",
    "+e683da7b4fe46164b9db3fd599481ad0630d2d892546c1ac63e59a5acb903140",
    "+d6619d6dd17a23fbd8bfe8aebc7065956feb956b66bb7d2867e190441657e2f4",
    "+0911107983da4b581a109b5fac9579d89e29f06f10d803370f88a41100c3374e",
    "+6beaa7c569c1000f4fcef4ce3133b18609aea52adf95d5992970ea5e0cedda87",
    "+19bdab59b24f7ef2a9d0b1b0942cff450875302e0c59c437a372eb6bb27a0b43",
    "+279320364fc3edd39b77f1fa29594d442e39220b165956fa729f741150b0dc4d",
    "+f4871371ff27f467e71087dd6bb38c975c5a49bdff02de6b5ca5e43bbf5b3c3b",
    "+5fb6b29846e95c88d464e003c835ca4f88260eaa57cd8deded8fc8038dfcbc60",
    "+8a1a3df89bf87e6c7bd29e06aaf7e3d7f1eef45f2058413a70bed0f4e3cb37f8",
    "+2dc40508f548b405fa2a64a24e91c9b6ea80ccf28f4cd80686627e55a91efc4b",
    "+6089206bdd49e8e6c824b4896f5b3c2d71207c30c6bf056d430ba0d8838e7c51",
    "+e8720600afd888455fe9eea4c859d08efd8122f4f732bba94504cfefc318de55",
    "+d4ce34592854e06370a79ee95e4bdf8eeb9d0d37dd0c802d9ad2357fd4cb9ec7"
  ]
}
_tx_filter = {
  :blockId => "39391848391772781",
  :senderId => "14815133512790761431L",
  :recipientId => "10020978176543317477L",
  :limit => 1, :offset => 0,
  :orderBy => "blockId"
}
_raw_tx = {
  :secret => _secret,
  :publicKey => _public_key,
# :secondSecret => _second_secret,
  :recipientId => "15709494141295217973L",
  :amount => 1e7
}
_tx_id = "17278680718005275020"
_peer_filter = {
  :state => 2,
  :os => "linux3.10.0-042stab123.6",
  :version => "0.9.10b",
  :limit => 10,
  :offset => 0,
  :orderBy => "version"
}
_ip_filter = {
  :ip => "149.56.108.109",
  :port => 7000
}
_block_filter = {
  :generatorPublicKey => "5ad8b74e39ad7502c8eeea080c8627b3aa9bb28651b988ef38112f21367b132d",
  :height => 3481431,
  :previousBlock => "8589373032001092432",
  :totalAmount => 0,
  :totalFee => 0,
  :limit => 1,
  :offset => 0,
  :orderBy => "height"
}
_block_id = "8589373032001092432"
_secrets = {
  :secret => _secret,
  :secondSecret => _second_secret,
  :publicKey => _public_key
}
_ms_secrets = {
  :secret => _secret,
# :secondSecret => _second_secret,
  :lifetime => 72,
  :min => 2,
  :keysgroup => [
    "+6089206bdd49e8e6c824b4896f5b3c2d71207c30c6bf056d430ba0d8838e7c51",
    "+e8720600afd888455fe9eea4c859d08efd8122f4f732bba94504cfefc318de55",
    "+d4ce34592854e06370a79ee95e4bdf8eeb9d0d37dd0c802d9ad2357fd4cb9ec7"
  ]
}
_ms_signature = {
  :secret => _secret,
  :publicKey => _public_key,
  :transactionId => _tx_id
}
_delegate = {
  :secret => _secret,
# :secondSecret => _second_secret,
  :username => _user
}
_delegate_filter = {
  :limit => 3,
  :offset => 0,
  :orderBy => "username"
}
_delegate_query = {
  :q => "4fryn",
  :orderBy => "producedblocks:desc"
}

# Testing legacy API against https://github.com/4fryn/lisk.rb/issues/4
account = legacy_api.accounts_open _secret
p account
balance = legacy_api.accounts_get_balance _address
p balance
public_key = legacy_api.accounts_get_public_key _address
p public_key
public_key = legacy_api.accounts_generate_public_key _secret
p public_key
account = legacy_api.accounts _address
p account
delegate = legacy_api.accounts_delegates_get_by_address _address
p delegate
votes = legacy_api.accounts_delegates_put _votes
p votes

syncing = legacy_api.loader_status_sync
p syncing
status = legacy_api.loader_status
p status
ping = legacy_api.loader_status_ping
p ping

transactions = legacy_api.transactions
p transactions
transactions = legacy_api.transactions _tx_filter
p transactions
transaction = legacy_api.transactions_put _raw_tx
p transaction
transaction = legacy_api.transactions_get_by_id _tx_id
p transaction
transaction = legacy_api.transactions_unconfirmed_get_by_id _tx_id
p transaction
transaction = legacy_api.transactions_unconfirmed
p transaction
transaction = legacy_api.transactions_queued
p transaction
transaction = legacy_api.transactions_queued_get_by_id _tx_id
p transaction

peers = legacy_api.peers
p peers
peers = legacy_api.peers _peer_filter
p peers
peer = legacy_api.peers_get _ip_filter
p peer
version = legacy_api.peers_version
p version

blocks = legacy_api.blocks
p blocks
blocks = legacy_api.blocks _block_filter
p blocks
block = legacy_api.blocks_get_by_id _block_id
p block
fee = legacy_api.blocks_get_fee
p fee
fees = legacy_api.blocks_get_fees
p fees
reward = legacy_api.blocks_get_reward
p reward
supply = legacy_api.blocks_get_supply
p supply
height = legacy_api.blocks_get_height
p height
status = legacy_api.blocks_get_status
p status
nethash = legacy_api.blocks_get_nethash
p nethash
milestone = legacy_api.blocks_get_milestone
p milestone

fee = legacy_api.signatures_fee
p fee
transaction = legacy_api.signatures_put _secrets
p transaction

delegate = legacy_api.delegates_put _delegate
p delegate
delegates = legacy_api.delegates
p delegates
delegates = legacy_api.delegates _delegate_filter
p delegates
delegate = legacy_api.delegates_get_by_key _public_key
p delegate
delegate = legacy_api.delegates_get_by_name _user
p delegate
delegates = legacy_api.delegates_search _delegate_query
p delegates
count = legacy_api.delegates_count
p count
account = legacy_api.accounts_delegates _address
p account
voters = legacy_api.delegates_voters _public_key
p voters
address = legacy_api.delegates_forging_enable _secret
p address
address = legacy_api.delegates_forging_disable _secret
p address
forged = legacy_api.delegates_forging_get_forged_by_account _public_key
p forged
forgers = legacy_api.delegates_get_next_forgers
p forgers
forgers = legacy_api.delegates_get_next_forgers 3
p forgers

#legacy_api.dapps_put ### UNIMPLEMENTED (#4)
#legacy_api.dapps filter ### UNIMPLEMENTED (#4)
#legacy_api.dapps_get_by_id id ### UNIMPLEMENTED (#4)
#legacy_api.dapps_search query ### UNIMPLEMENTED (#4)
#legacy_api.dapps_install ### UNIMPLEMENTED (#4)
#legacy_api.dapps_installed ### UNIMPLEMENTED (#4)
#legacy_api.dapps_installed_ids ### UNIMPLEMENTED (#4)
#legacy_api.dapps_uninstall ### UNIMPLEMENTED (#4)
#legacy_api.dapps_launch ### UNIMPLEMENTED (#4)
#legacy_api.dapps_installing ### UNIMPLEMENTED (#4)
#legacy_api.dapps_uninstalling ### UNIMPLEMENTED (#4)
#legacy_api.dapps_launched ### UNIMPLEMENTED (#4)
#legacy_api.dapps_categories ### UNIMPLEMENTED (#4)
#legacy_api.dapps_stop ### UNIMPLEMENTED (#4)

transaction = legacy_api.multisignatures_put _ms_secrets
p transaction
accounts = legacy_api.multisignatures_accounts _public_key
p accounts
transaction = legacy_api.multisignatures_sign _ms_signature
p transaction
transactions = legacy_api.multisignatures_pending _public_key
p transactions

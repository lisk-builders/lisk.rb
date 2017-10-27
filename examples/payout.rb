#!/usr/bin/env ruby

require 'lisk'

# Try to connect a local Lisk client on test network.
# Warning: Think twice and test thoroughly before enabling this on main network!
client = Lisk::Client.new "127.0.0.1", 7000

# The pre-1.0.0 legacy API connected to the client.
legacy_api = Lisk::Legacy.new client

# Only proceed if the client is connected, active, and fully synchronized.
if legacy_api.loader_status_ping

  # Get the desired delegate by name.
  delegate = legacy_api.delegates_get_by_name "4fryn"
  p "Delegate #{delegate["username"]} is rank \##{delegate["rank"]} with #{delegate["approval"]}\% approval and #{delegate["productivity"]}\% productivity."

  # Get a list of voters for a delegate.
  deleagte_public_key = delegate["publicKey"]
  deleagte_address = delegate["address"]
  deleagte_voters = legacy_api.delegates_voters deleagte_public_key

  # Get the total vote weight of our delegate
  deleagte_total_weight = delegate["vote"].to_f

  # Get the forging rewards from balance
  payout_balance = legacy_api.accounts_get_balance deleagte_address
  payout_balance = payout_balance["balance"].to_f

  # Our pool is sharing 80%, and keeping 20%
  pool_share = 0.80

  # Filter out voters with out any Lisk
  voter_threshold = 0

  _debug_payout_sum = 0

  # Iterate all voters
  deleagte_voters.each do | voter |
    voter_balance = voter["balance"].to_f

    # Only handle voters with balance above threshold
    if voter_balance > voter_threshold # and not voter["address"].eql? deleagte_address
      voter_share = voter["balance"].to_f / deleagte_total_weight
      payout = voter_share * payout_balance * pool_share
      # @TODO: do some handling of dust amounts
      # @TODO: do sanity checks and create transactions here ...
      p "Sending #{payout / 1e8} LSK to voter #{voter["address"]}..."
      _debug_payout_sum += payout
    end
  end

  # @TODO: sending 20% delegate share to her private address
  p "Sending #{payout_balance * 0.20 / 1e8} LSK to delegate private funds..."

  # _debug_payout_diff should be 0
  _debug_payout_sum += payout_balance * 0.20
  _debug_payout_diff = payout_balance - _debug_payout_sum
  p "#{_debug_payout_diff === 0}"

else
  p 'Lisk node disconnected, inactive, or not fully synchronized ...'
end

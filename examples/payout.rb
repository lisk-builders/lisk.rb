#!/usr/bin/env ruby

require 'lisk'

# Try to connect a local Lisk client.
client = Lisk::Client.new "127.0.0.1", 8000

# The pre-1.0.0 legacy API connected to the client.
legacy_api = Lisk::Legacy.new client

# Only proceed if the client is connected, active, and fully synchronized.
if legacy_api.ping

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

  # Filter out voters with out any Lisk
  voter_threshold = 0

  # Iterate all voters
  deleagte_voters.each do | voter |
    voter_balance = voter["balance"].to_f

    # Only handle voters with balance above threshold
    if voter_balance > voter_threshold # and not voter["address"].eql? deleagte_address
      voter_share = voter["balance"].to_f / deleagte_total_weight
      payout = voter_share * payout_balance

      # @TODO: do sanity checks and create transactions here ...
      p "Sending #{payout / 1e8} LSK to voter #{voter["address"]}..."
    end
  end

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

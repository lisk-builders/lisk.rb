#!/usr/bin/env ruby

require 'lisk'

client = Lisk::Client.new
client = Lisk::Client.new("127.0.0.1", 8000)

client.status
client.configure("127.0.0.1", 8000)

account = Lisk::Account.new("14524922419337843943L")
client.get_address(account)

block = Lisk::Block.new("11145685198263496703")

delegate = Lisk::Delegate.new("lightcurve")
client.get_address(delegate)
client.get_voters(delegate)

transaction = Lisk::Transaction.new("10153999325502978458")

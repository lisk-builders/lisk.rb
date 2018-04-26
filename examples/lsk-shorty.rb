#!/bin/env ruby
require "lisk"
require "bip_mnemonic"
require "securerandom"

@counter = 0
@node = Lisk::Client.new "127.0.0.1", 7000
@lisk = Lisk::API.new @node
@start = Time.now.to_i.to_f

def runner id
	target = 18
	while true
		@counter += 1
		entropy = SecureRandom.hex
	  phrase = BipMnemonic.to_mnemonic(entropy: entropy)
		account = @lisk.accounts_open(phrase)
		address = account["address"]
		length = address.length
		if length < target or length < 10
			snapshot = Time.now.to_i.to_f
			velocity = @counter.to_f / (snapshot - @start)
			printf "\##{id}\t#{length}\t#{address}\t#{phrase}\t#{@counter}\t#{'%.1f' % velocity}/s\n"
			target = length
		end
	end
end

t0 = Thread.new{ runner(0) }
t1 = Thread.new{ runner(1) }
t2 = Thread.new{ runner(2) }
t3 = Thread.new{ runner(3) }
t0.join
t1.join
t2.join
t3.join

 # ...
 

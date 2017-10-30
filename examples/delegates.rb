#!/usr/bin/env ruby

require 'lisk'

node     = Lisk::Client.new
api      = Lisk::API.new node

delegate = Lisk::Delegate.new api, "4fryn"
p delegate.is_registered?

delegate = Lisk::Delegate.new api, "not_4fryn"
p delegate.is_registered?

delegate.set_secrets "lorem ipsum foo bar", "foo bar lorem ipsum"
p delegate.register

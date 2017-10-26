# Lisk.rb

A simple Ruby wrapper for the Lisk API. 💎

## Note before using

This is very early work-in-progress. The idea is to publish this `gem` as soon as it is fully compatible with Lisk Core 1.0.0, which, however, is not released yet. The current implementation of the lisk.rb gem is pure minimal by design and barely allows checking the node status.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lisk'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install lisk
```

## Usage

Make sure to include lisk.rb in your scripts.

```ruby
require 'lisk'
```

To get started, point the lisk.rb to any Lisk-API endpoint. By default, lisk.rb assumes a running Lisk node on localhost port 8000.

```ruby
client = Lisk::Client.new "127.0.0.1", 8000
```

For convenience, check if the Lisk node is connected, fully synchronized, and active by pinging it.

```ruby
if client.ping
  # only do stuff if client is connected, fully synchronized, and active ...
end
```

Get the version of the connected Lisk node.

```ruby
version = client.version
p "Lisk node version #{version["version"]} build #{version["build"]}..."
```

Get the status of the connected Lisk node.

```ruby
status = client.status
p "Lisk node is connected: #{status["success"]}... Blockchain loaded: #{status["loaded"]}..."
```

Figure out if the node is still synchronizing.

```ruby
syncing = client.sync
p "Lisk node is syncing: #{syncing["syncing"]}... #{syncing["blocks"]} remaining blocks to latest block #{syncing["height"]}..."
```

Let's have a look at the connected peers.

```ruby
peers = client.peers
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
```

Get some global Lisk blockchain stats.

```ruby
chain = client.chain
p "Lisk chain latest block: #{chain["height"]}... total supply: #{chain["supply"] / 1e8}... block reward: #{chain["reward"] / 1e8}"
```

To be continued, see `example.rb` for some examples.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/4fryn/lisk.rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lisk.rb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/4fryn/lisk.rb/blob/master/CODE_OF_CONDUCT.md).

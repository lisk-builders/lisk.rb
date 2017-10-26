# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lisk/version"

Gem::Specification.new do |lisk|
  lisk.name          = "lisk"
  lisk.version       = Lisk::VERSION
  lisk.authors       = ["4fryn Dings"]
  lisk.email         = ["ruby@4fry.net"]

  lisk.description   = 'A Ruby wrapper for the Lisk blockchain platform API.'
  lisk.homepage      = 'https://github.com/4fryn/lisk.rb'
  lisk.summary       = 'Lisk API Ruby wrapper.'
  lisk.license       = "MIT"

  lisk.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  lisk.bindir        = "exe"
  lisk.executables   = lisk.files.grep(%r{^exe/}) { |f| File.basename(f) }
  lisk.require_paths = ["lib", "bin"]

  lisk.add_development_dependency "bundler", "~> 1.15"
  lisk.add_development_dependency "rake", "~> 10.0"
  lisk.add_development_dependency "rspec", "~> 3.0"

  lisk.add_dependency "todonotes", "~> 0.2.2"
end

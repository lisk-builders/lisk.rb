require "lisk/version"
require "todonotes"

# The Lisk API Ruby wrapper gem.
module Lisk
  require "lisk/client"
  require "lisk/legacy"

  # Handles unimplemented methods
  def self.method_missing
    todo "#{self}::#{__method__} METHOD MISSING"
  end
end

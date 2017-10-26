require "lisk/version"
require "todonotes"

module Lisk
  require "lisk/client"

  # Unimplemented methods
  def self.method_missing
    todo "#{self}::#{__method__} METHOD MISSING"
  end
end

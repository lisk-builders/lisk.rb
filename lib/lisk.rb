require "lisk/version"
require "todonotes"

# The Lisk API Ruby wrapper gem.
module Lisk
  require "lisk/client"
  require "lisk/legacy"
  require "lisk/raw"
  require "lisk/api"

  # Handles unimplemented methods
  def method_missing name, *args, &block
    todo "#{self}::#{name} METHOD MISSING"
  end
end

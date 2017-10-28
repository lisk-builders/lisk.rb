require "lisk/version"
require "todonotes"

# The Lisk API Ruby wrapper gem.
module Lisk
  require "lisk/api"
  require "lisk/client"
  require "lisk/legacy"
  require "lisk/tools"

  # Handles unimplemented methods
  def method_missing name, *args, &block
    todo "#{self}::#{name} METHOD MISSING"
  end
end

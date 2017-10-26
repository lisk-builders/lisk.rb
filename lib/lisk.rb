require "lisk/version"
require "todonotes"

module Lisk
  require "lisk/client"
  require "lisk/account"
  require "lisk/block"
  require "lisk/delegate"
  require "lisk/transaction"

  def self.method_missing
    todo "#{self}::#{__method__} NOT IMPLEMENTED"
  end
end

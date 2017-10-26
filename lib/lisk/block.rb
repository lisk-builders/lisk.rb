module Lisk

  class Block

    def initialize(args)
      todo "#{self}::#{__method__} NOT IMPLEMENTED"
    end

    def method_missing(name, *args, &block)
      todo "#{self}::#{name} METHOD MISSING"
    end

  end

end

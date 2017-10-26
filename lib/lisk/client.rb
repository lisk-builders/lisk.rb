module Lisk

  class Client

    def initialize ip = "127.0.0.1", port = 8000
      todo "#{self}::#{__method__} NOT IMPLEMENTED"
    end

    def configure ip, port
      todo "#{self}::#{__method__} NOT IMPLEMENTED"
    end

    def status
      todo "#{self}::#{__method__} NOT IMPLEMENTED"
    end

    def get_address account
      todo "#{self}::#{__method__} NOT IMPLEMENTED"
    end

    def get_voters account
      todo "#{self}::#{__method__} NOT IMPLEMENTED"
    end

    def method_missing(name, *args, &block)
      todo "#{self}::#{name} METHOD MISSING"
    end

  end

end

module Lisk

  class Delegate

    attr_accessor :api
    attr_accessor :delegate_name
    attr_accessor :address
    attr_accessor :public_key
    attr_accessor :secret
    attr_accessor :secret_secondary
    attr_accessor :registered

    def initialize api, delegate_name
      @api = api
      @delegate_name = delegate_name
      delegate = @api.delegates_get_by_name delegate_name
      if delegate.nil?
        @registered = false
      else
        @registered = true
        @address = delegate["address"]
        @public_key = delegate["publicKey"]
      end
    end

    def is_registered?
      return registered
    end

    def set_secrets secret, second_secret = nil
      @secret = secret
      @secret_secondary = second_secret
    end

    def register
      if not self.is_registered?
        delegate = {}
        delegate[:username] = @delegate_name
        if not @secret_secondary.nil?
          delegate[:secondSecret] = @secret_secondary
        end
        if not @secret.nil?
          delegate[:secret] = @secret
          registration = api.delegates_put delegate
          return registration
        else
          return false
        end
      else
        return false
      end
    end

  end
end

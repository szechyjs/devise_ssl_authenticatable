require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class SslAuthenticatable < Authenticatable
      def authenticate!
        # TODO: implement
      end
    end
  end
end

Warden::Strategies.add(:ssl_authenticatable, Devise::Strategies::SslAuthenticatable)

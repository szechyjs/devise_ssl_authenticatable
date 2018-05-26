require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    #
    # Strategy for signing in a user, based on a SSL certificate.
    #
    class SslAuthenticatable < Authenticatable
      def authenticate!
        resource = mapping.to.find_for_ssl_authentication(authentication_hash)
        return fail(:invalid_ssl) unless resource

        if validate(resource)
          resource.after_ssl_authentication
          success!(resource)
        end
      end

      def store?
        false
      end

      def valid?
        super || valid_for_ssl_auth?
      end

      private

      # Check if this strategy is valid for ssl authentication by:
      #
      #   * If the request contians valid SSL headers
      #   * If all authentication keys are present
      #
      def valid_for_ssl_auth?
        client_verify? && with_authentication_hash(:ssl_auth, ssl_auth_hash)
      end

      def ssl_auth_hash
        { authentication_keys.first => client_dn, email: client_email }
      end

      # Does the request contain a valid SSL cert?
      def client_verify?
        request.headers['puma.peercert'] || request.headers['X-SSL-Client-Verify'] == 'SUCCESS'
      end

      # The DN of the client certificate
      def client_dn
        request.headers['puma.peercert'].subject.to_s
      end

      def client_email
        request.headers['puma.peercert'].subject.to_s.match(/emailAddress=([^\/]*)/)[0]
      end

      # Overwrite authentication keys to use ssl_client_dn_field.
      def authentication_keys
        @authentication_keys ||= [Devise::ssl_client_dn_field]
      end
    end
  end
end

Warden::Strategies.add(:ssl_authenticatable, Devise::Strategies::SslAuthenticatable)

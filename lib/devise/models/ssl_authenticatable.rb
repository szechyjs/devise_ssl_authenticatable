module Devise
  module Models
    module SslAuthenticatable
      extend ActiveSupport::Concern

      # Hook called after ssl authentication
      def after_ssl_authentication
      end

      module ClassMethods
        def find_for_ssl_authentication(authentication_hash)
          dn_field = ssl_client_dn_field.to_sym
          dn = authentication_hash[dn_field]
          resource = find_for_authentication(dn_field => dn) || new(dn_field => dn)
          resource
        end

        Devise::Models.config(self, :ssl_client_dn_field)
      end
    end
  end
end

module Devise
  module Models
    module SslAuthenticatable
      extend ActiveSupport::Concern

      included do
        attr_accessor :ssl_attributes
      end

      module ClassMethods
        Devise::Models.config(self, :ssl_client_dn_field)
      end
    end
  end
end

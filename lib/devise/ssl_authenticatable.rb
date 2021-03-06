require 'devise'

require 'devise/strategies/ssl_authenticatable'

module Devise
  # The database column that holds the DN of the user
  mattr_accessor :ssl_client_dn_field
  @@ssl_client_dn_field = :ssl_client_dn

end

Devise.add_module(:ssl_authenticatable, strategy: true,
                  model: true, no_input: true)

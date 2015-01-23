require 'devise'

require 'devise/strategies/ssl_authenticatable'

module Devise
  # The database column that holds the DN of the user
  mattr_accessor :ssl_client_dn_field
  @@ssl_dn_field = :ssl_client_dn

end

Devise.add_module(:ssl_authenticatable, :route => :session, :strategy => true,
                  :controller => :sessions, :model => true)

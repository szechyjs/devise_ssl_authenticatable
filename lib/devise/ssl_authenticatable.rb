require 'devise'

module Devise

end

Devise.add_module(:ssl_authenticatable, :route => :session, :strategy => true,
                  :controller => :sessions, :model => true)

require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class SslAuthenticatable < Authenticatable
      def authenticate!
        $stdout.puts request.headers['X-SSL-Client-Verify']
        if request.headers['X-SSL-Client-Verify'] != 'SUCCESS'
          $stdout.puts 'invalid'
          return fail(:invalid)
        else
          dn = request.headers['X-SSL-Client-DN']
          issuer = request.headers['X-SSL-Issuer']
          $stdout.puts dn
          $stdout.puts issuer
          $stdout.puts 'success'
          return success(dn)
        end
      end
    end
  end
end

Warden::Strategies.add(:ssl_authenticatable, Devise::Strategies::SslAuthenticatable)

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/ssl_authenticatable/version'

Gem::Specification.new do |spec|
  spec.name          = "devise_ssl_authenticatable"
  spec.version       = Devise::SslAuthenticatable::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Jared Szechy"]
  spec.email         = ["jared.szechy@gmail.com"]
  spec.summary       = %q{Implements SSL client authentication for Devise.}
  spec.description   = %q{Reads the SSL client authentication headers from your webserver.}
  spec.homepage      = "http://github.com/szechyjs/devise_ssl_authenticatable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'devise', '~> 4'

  spec.add_development_dependency "rails",  "~> 5"
  spec.add_development_dependency "rspec-rails", "~> 5.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

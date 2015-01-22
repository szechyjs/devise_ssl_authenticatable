# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise_ssl_authenticatable/version'

Gem::Specification.new do |spec|
  spec.name          = "devise_ssl_authenticatable"
  spec.version       = Devise::SslAuthenticatable::VERSION
  spec.authors       = ["Jared Szechy"]
  spec.email         = ["jared.szechy@brilligent.com"]
  spec.summary       = %q{Implements SSL client authentication for Devise.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "http://github.com/brilligent/devise_ssl_authenticatable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'devise', '~> 3.4.1'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

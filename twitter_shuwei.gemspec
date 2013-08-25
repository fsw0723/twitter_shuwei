# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_shuwei/version'

Gem::Specification.new do |spec|
  spec.name          = "twitter_shuwei"
  spec.version       = TwitterShuwei::VERSION
  spec.authors       = ["fsw0723"]
  spec.email         = ["haha876@163.com"]
  spec.description   = "twitter api"
  spec.summary       = "twitter api"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "twitter_oauth"
end

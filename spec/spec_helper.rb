require 'twitter_shuwei'
require 'twitter_oauth'
require 'twitter_shuwei/tweet'
require 'twitter_shuwei/user'
require 'active_support/core_ext'
require 'vcr'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true

  VCR.configure do |config|
    config.cassette_library_dir = 'spec/cassettes'
    config.hook_into :webmock
    config.configure_rspec_metadata!
    config.default_cassette_options = { :record => :new_episodes }
    config.allow_http_connections_when_no_cassette = true
  end
end

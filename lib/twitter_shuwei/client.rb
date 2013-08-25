require 'twitter_oauth'

module TwitterShuwei
  class Client
    def initialize(options = {})
      @client = TwitterOAuth::Client.new(
          :consumer_key => options[:consumer_key],
          :consumer_secret => options[:consumer_secret],
          :token => options[:token],
          :secret => options[:secret]
      )
    end

    def search_tweet params
      TwitterShuwei::TweetSearchResult.new(@client.send(:get, "/search/tweets.json?q=#{params[:keyword]}&count=#{params[:count]}&lang=en")).to_model
    end
  end
end
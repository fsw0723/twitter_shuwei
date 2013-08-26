require 'twitter_oauth'

module TwitterShuwei
  class TwitterClient
    def initialize(options = {})
      @client = TwitterOAuth::Client.new(
          :consumer_key => options[:consumer_key],
          :consumer_secret => options[:consumer_secret],
          :token => options[:token],
          :secret => options[:secret]
      )
    end

    def search_tweet params
      keyword = params[:keyword].gsub(" ", "+")
      TwitterShuwei::TweetSearchResult.new(@client.send(:get, "/search/tweets.json?q=#{keyword}&count=#{params[:count]}&lang=en")).to_model
    end

    def show_user params
      TwitterShuwei::UserFetchResult.new(@client.send(:get, "/users/show/#{params[:name]}.json")).to_model
    end

    def fetch_timeline params
      TwitterShuwei::UserFetchResult.new(@client.send(:get, "/statuses/user_timeline.json?screen_name=#{params[:screen_name]}")).parse_timeline
    end
  end
end
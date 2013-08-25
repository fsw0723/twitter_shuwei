
module TwitterShuwei
  class TweetSearchResult
    def initialize tweets
      @tweets = tweets['statuses']
    end

    def to_model
      @tweets.map! do |tweet|
        Tweet.new(id: tweet['id'], created_at: tweet['created_at'],text:tweet['text'], user:User.new(name:tweet['user']['name']))
      end
      return @tweets
    end
  end
end
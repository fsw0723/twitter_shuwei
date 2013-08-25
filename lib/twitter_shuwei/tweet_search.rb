module TwitterShuwei
  class TweetSearch

    def self.search(keyword, count)
      client = TwitterShuwei::Client.auth
      TwitterShuwei::TweetSearchResult.new(client.send(:get, "/search/tweets.json?q=#{keyword}&count=#{count}&lang=en")).to_model
    end
  end
end
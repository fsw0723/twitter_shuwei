module TwitterShuwei
  class UserFetchResult
    def initialize hash
      @hash = hash
    end

    def to_model
      puts @hash
      User.new(id: @hash['id'], screen_name: @hash['screen_name'], name: @hash['name'], location: @hash['location'],
               description: @hash['description'], profile_image_url: @hash['profile_image_url'],
               status: Tweet.new(text: @hash.try(:[], :status).try(:[], :text),
                                 created_at: @hash.try(:[], :status).try(:[], :created_at)))
    end

    def parse_timeline user
      result = [@hash].flatten
      result.map! do |tweet|
        Tweet.new(created_at: tweet['created_at'], id: tweet['id'], text: tweet['text'])
      end
      user.tweets = result
      return user
    end
  end
end
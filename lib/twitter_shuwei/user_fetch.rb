require 'twitter_oauth'
module TwitterShuwei
  class UserFetch
    @client = Service::TwitterSession.auth
    def self.fetch_user params
      Service::UserFetchResult.new(@client.show(params[:name])).to_model

    end

    def self.find_timeline user
      Service::UserFetchResult.new(@client.send(:get, "/statuses/user_timeline.json?screen_name=#{user.screen_name}")).parse_timeline(user)
    end
  end
end
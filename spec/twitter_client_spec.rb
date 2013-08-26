require 'spec_helper'

describe TwitterShuwei::TwitterClient do
  before do
    @client = TwitterShuwei::TwitterClient.new(:consumer_key => "kcK4sgEVaOkmpPogw5UwQ", :consumer_secret => "lGGK1B8ON46V6t8Q27K5Dfkt6Pi5S2rE9kFdFnNofo",
                                               :token => "1672554398-m0VpYgcLfnrqz0CxdabdYMK8ow9TFlivT2pyL1f", :secret => "EgS3G7kkRPq4iBNEyzwJhSQAvTvesaWuuQWvsZOKmSs")
  end

  context "tweet search", :vcr do
    it "should return 3 search result" do
      response = @client.search_tweet({:keyword=>'happy',:count => 3})
      response.count.should == 3
    end
  end

  context "user search", :vcr do
    it "should return a user", :vcr do
      @client.show_user(name:'gem').should_not be_nil
    end
  end

  context 'timeline_search', :vcr do
    it "should return a user with timeline" do
      @client.fetch_timeline(:screen_name => 'fsw0723').should_not be_nil
    end
  end
end
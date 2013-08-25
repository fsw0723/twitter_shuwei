class User
  attr_accessor :id, :screen_name, :name, :location, :description, :profile_image_url, :status, :tweets

  def initialize attributes
    attributes.keys.each {|k| instance_variable_set("@#{k}", attributes[k]) if respond_to?(k) }
  end

  def self.fetch params
    user = Service::UserFetch.fetch_user params
  end

  def self.timeline_tweets params
    user = fetch(params)
    Service::UserFetch.find_timeline user
  end
end
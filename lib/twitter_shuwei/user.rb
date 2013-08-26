class User
  attr_accessor :id, :screen_name, :name, :location, :description, :profile_image_url, :status, :tweets

  def initialize attributes
    attributes.keys.each {|k| instance_variable_set("@#{k}", attributes[k]) if respond_to?(k) }
  end
end
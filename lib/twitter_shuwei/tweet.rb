module TwitterShuwei
  class Tweet
    attr_accessor :id, :created_at, :text, :user

    def initialize attributes
      attributes.keys.each { |k| instance_variable_set("@#{k}", attributes[k]) if respond_to?(k) }
    end
  end
end
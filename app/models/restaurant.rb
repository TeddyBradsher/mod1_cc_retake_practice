class Restaurant

    attr_accessor :restaurant_owner, :name, :star_rating
    @@all = []

    def initialize (restaurant_owner, name, star_rating)
        @restaurant_owner = restaurant_owner
        @name = name
        @star_rating = star_rating
        @@all << self
    end

    def self.all
        @@all
    end

end
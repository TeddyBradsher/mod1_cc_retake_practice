class Restaurant
    # CARYN SAYS: be certain you're calling everything by the right names
    # it's supposed to be owner, not restaurant_owner
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

    def menu_items
        MenuItem.all.select do |item|
            item.restaurant == self
        end
    end

    def recipes
        menu_items.map do |rec|
            # CARYN SAYS: good start with using menu_items but then why are you grabbing the restaurant?
            rec.restaurant.menu_items
        end.uniq
    end

    def has_dish?(menu_item)
        # CARYN SAYS: this will take a Recipe instance
        # You're close, but not quite there 
        menu_items.include?(menu_item)
        #  MenuItem.all.include?(menu_item)       
    end

    def self.highest_rated
        # CARYN SAYS: nice
        Restaurant.all.sort_by do |res|
            -res.star_rating #minus reverses the array results
        end.first
    end

end
class RestaurantOwner

    attr_accessor :name, :age
    @@all = []
    
    def initialize (name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def restaurants
        Restaurant.all.select do |rest|
            rest.restaurant_owner == self
        end
    end

    def menu_items
        restaurants.map do |rest|
            rest.menu_items
        end
    end



    def self.average_age
        #use "ages = map results" to return an array of the all owners' ages"
        ages = RestaurantOwner.all.map do |owner|
            owner.age
        end
        #use values of created array to find average (sum of ages / number of ages in array)
        ages.sum / ages.count
    end

    def sell_restaurant(restaurant, buyer)
       owned_rest = Restaurant.all.select do |rest|
            rest.restaurant_owner == self 
       end
        
        for_sale = owned_rest.select do |rest|
            rest == restaurant
        end.first
        for_sale.restaurant_owner = buyer
        for_sale #returns restaurant instance
    end


end
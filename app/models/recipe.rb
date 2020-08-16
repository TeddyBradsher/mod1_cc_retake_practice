class Recipe

    attr_reader :name
    attr_accessor :description
    @@all = []

        def initialize (name, description)
            @name = name
            @description = description
            @@all << self
        end

        def self.all
            @@all
        end

        #call an array of all instances of MenuItem class using Recipeinstance.menu_item
        def menu_items
            MenuItem.all.select do |item|
            item.recipe == self
            end
        end

        #call an array of menu_items instances associated with a Restaurant instance
        def restaurants
            menu_items.map do |rest|
                rest.restaurant
            end
        end

        def self.average_price_class
            prices = MenuItem.all.map do |rec|
                rec.price
            end
            prices.sum / prices.count
        end

        def average_price
            self.menu_items.reduce(0.0) do |sum, recipe|
                sum + recipe.price
            end/self.menu_items.size
            
        end

        def highest_price
             self.menu_items.reduce do |a, b|
            a.price > b.price ? a.price : b.price
            end.to_i
        end

        def cheapest_restaurant
            self.menu_items.reduce do |a, b|
                a.price < b.price ? a.restaurant : b.restaurant
                end
        end



end
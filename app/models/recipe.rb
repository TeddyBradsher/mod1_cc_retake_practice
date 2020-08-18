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
            # CARYN SAYS: watch your indenting! 
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

        # CARYN SAYS: why are there so many versions of average class, including as a class method? 
        # if there is code that is old / you discovered you didnt need or didn't work please comment out and say that! 
        def self.average_price_class
            prices = MenuItem.all.map do |rec|
                rec.price
            end
            prices.sum / prices.count
        end

        def average_price_2
            prices = self.menu_items.map do |rec|
                rec.price
            end
            prices.sum / prices.count

        end


        def average_price
            # CARYN SAYS: generally looks good, but i wouldn't call the menu_item element a recipe, cause it's not a recipe :) 
            self.menu_items.reduce(0.0) do |sum, recipe|
                sum + recipe.price
            end/self.menu_items.size
            
        end

        def highest_price
            # CARYN SAYS: max_by would be a better enumerable to use here, and then make sure you're returning the integer price! 
            self.menu_items.reduce do |a, b|
                a.price > b.price ? a.price : b.price
            end.to_i
        end

        def cheapest_restaurant
            self.menu_items.reduce do |a, b|
                a.price < b.price ? a.restaurant : b.restaurant
                end
        end

        def self.inactive
            all_recipes = Recipe.all
            menu_recipes = MenuItem.all.map do |item|
                item.recipe
            end.uniq
            answer = all_recipes - menu_recipes
            # CARYN SAYS: you can't  subtract arrays
            # what's below here is actually closer to the logic for this!
            # we need to select just the Recipe instances that do have restaurants

            # MenuItem.all.select do |empty|
            #     empty.recipe.restaurant == nil
            # end
        end



end
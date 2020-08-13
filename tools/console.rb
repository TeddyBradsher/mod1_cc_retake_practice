# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end

owner1 = RestaurantOwner.new("Ted", 35)
owner2 = RestaurantOwner.new("John", 4)
owner3 = RestaurantOwner.new("Bill", 12)
owner4 = RestaurantOwner.new("Ray", 14)

rest1 = Restaurant.new(owner1, "McDonalds", 2)
rest2 = Restaurant.new(owner2, "BK", 3)
rest3 = Restaurant.new(owner3, "Wendy's", 4)
rest4 = Restaurant.new(owner4, "Shake Shack", 5)

recipe1 = Recipe.new("Big Mac Meal", "Burger, Fries, Soda")
recipe2 = Recipe.new("Whopper Meal", "Flame broiled burger, Fries, Soda")
recipe3 = Recipe.new("Wendy's Value Meal", "Square burger, Fries, Soda")
recipe4 = Recipe.new("Shack Meal", "Shack burger, Fries, Soda")

item1 = MenuItem.new(rest1, recipe1, 5.00)
item2 = MenuItem.new(rest2, recipe2, 10.00)
item3 = MenuItem.new(rest3, recipe3, 15.00)
item4 = MenuItem.new(rest4, recipe4, 25.00)

# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
0

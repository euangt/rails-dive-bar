require 'json'
require 'open-uri'
puts "Cleaning database..."
Ingredient.destroy_all
Cocktail.destroy_all
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_serialized = open(url).read
ingredients = JSON.parse(list_serialized)
list = ingredients["drinks"]
sleep 1 
puts "Creating drinks..."
list.each do |ingredient|
  zutat = Ingredient.create(name: ingredient["strIngredient1"])
end
sleep 2 
puts "Finished!"
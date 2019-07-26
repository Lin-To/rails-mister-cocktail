# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# dependancy - need to delete doses first

require 'open-uri'

if Rails.env.development?
  Dose.delete_all
  # kill the child first before can kill the parent
  Ingredient.delete_all
  Cocktail.delete_all
end

puts "deleted old data"

url = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"
opened_url = open(url).read
parsed_url = JSON.parse(opened_url)
# add p to see what you get in terminal

parsed_url.each do |cocktail|
  c = Cocktail.create!(name: cocktail["name"])
  cocktail["ingredients"].each do |ingredient|
    if ingredient["ingredient"]
      i = Ingredient.find_or_create_by(name: ingredient["ingredient"])
      d = Dose.create(description: ingredient["amount"].to_s + " " + ingredient["unit"], cocktail: c, ingredient: i)
      puts "Added #{d.description} of #{i.name} to #{c.name}"
    end
  end
end


# ruby has a active record "find or create by"

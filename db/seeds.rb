puts "Cleaning database..."
Restaurant.destroy_all

r1 = Restaurant.new(name: "Capri", address: "Tizi Ouzou", category: "french")
r2 = Restaurant.new(name: "Mystic", address: "Tizi Ouzou", category: "italian")
r3 = Restaurant.new(name: "Twilsons", address: "Chatelêt les Halles", category: "french")
r4 = Restaurant.new(name: "Sushi master", address: "Trocadero", category: "japanese")
r5 = Restaurant.new(name: "Let's fries", address: "Bruxelles", category: "belgian")

[r1, r2, r3, r4, r5].each_with_index do |restaurant, index|
  puts "> Saving restaurant n°#{index + 1}..."
  restaurant.save
end

puts "Database created !"

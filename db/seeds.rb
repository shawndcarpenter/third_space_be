# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
boulder_locations = File.read('spec/fixtures/boulder_locations_top_50_results_search.json')
boulder_json = JSON.parse(boulder_locations, symbolize_names: true)
boulder_businesses = boulder_json[:businesses]

boulder_businesses.map do |business|
  poro = ThirdSpacePoro.new(business)
  poro.make_third_space
end

denver_locations = File.read('spec/fixtures/denver_locations_top_50_results_search.json')
denver_json = JSON.parse(denver_locations, symbolize_names: true)
denver_businesses = denver_json[:businesses]

denver_businesses.map do |business|
  poro = ThirdSpacePoro.new(business)
  poro.make_third_space
end

minn_locations = File.read('spec/fixtures/minn_locations_top_50_results_search.json')
minn_json = JSON.parse(minn_locations, symbolize_names: true)
minn_businesses = minn_json[:businesses]

minn_businesses.map do |business|
  poro = ThirdSpacePoro.new(business)
  poro.make_third_space
end

ThirdSpace.all.each_with_index do |space, index|
  if index % 10 == 0
    space.tags = ["Loud", "Happy", "Studious", "Happy", "Studious", "Happy", "Studious", "Happy", "Studious", "Happy", "Studious", "Happy", "Studious", "Customer Restrooms", "Parking", "Parking", "Parking", "Sober", "No Purchase Necessary", "Child Friendly", "Child Friendly", "Bright", "Transportation Close", "BIPOC Friendly", "Queer Friendly", "Respectful", "Gender Neutral Restrooms"]
  elsif index % 9 == 0
    space.tags = ["Quiet", "Happy", "Studious", "Happy", "Studious", "Accessible Entrance", "Accessible Entrance", "Accessible Entrance", "Accessible Entrance", "Customer Restrooms", "Customer Restrooms", "Parking", "Sober", "Purchase Necessary", "Purchase Necessary", "Purchase Necessary", "Child Friendly", "Child Friendly",  "Bright", "No Transportation Close", "BIPOC Friendly", "Queer Friendly", "Respectful", "Gender Neutral Restrooms"]
  elsif index % 8 == 0
    space.tags = ["Average Noise", "Studious", "Party", "Party", "Party", "Not Accessible", "Accessible Entrance", "Customer Restrooms", "Parking", "Sober", "No Purchase Necessary", "No Purchase Necessary", "No Purchase Necessary", "Bright","Transportation Close", "BIPOC Friendly", "Respectful", "Gender Neutral Restrooms"]
  elsif index % 7 == 0
    space.tags = ["Quiet", "Party", "Party", "Party", "Party", "Party", "Party", "Accessible Entrance", "Accessible Entrance", "Accessible Entrance", "No Customer Restrooms", "No Parking",  "No Parking", "Sober", "Purchase Necessary", "Purchase Necessary", "No Purchase Necessary", "Moody", "No Transportation Close", "Queer Friendly", "Responsive", "Gender Neutral Restrooms"]
  elsif index % 6 == 0
    space.tags = ["Average Noise", "Party", "Party", "Party", "Not Accessible", "Customer Restrooms",  "No Customer Restrooms", "Parking", "No Parking",  "No Parking", "Purchase Necessary", "Purchase Necessary", "Purchase Necessary", "Not Child Friendly", "Moody", "Transportation Close", "BIPOC Friendly", "Responsive", "No Gender Neutral Restrooms"]
  elsif index % 5 == 0
    space.tags = ["Loud", "Party", "Sad", "Sad", "Sad", "Sad", "Accessible Entrance", "Accessible Entrance", "Accessible Entrance", "No Customer Restrooms", "No Parking",  "No Parking", "Sober", "Sober", "Sober","Purchase Necessary", "Purchase Necessary", "Purchase Necessary", "Child Friendly", "Child Friendly",  "Moody", "No Transportation Close", "BIPOC Friendly", "Pushy", "No Gender Neutral Restrooms"]
  elsif index % 4 == 0
    space.tags = ["Average Noise", "Party", "Party", "Party", "Not Accessible", "Accessible Entrance", "Accessible Entrance", "Customer Restrooms", "No Customer Restrooms",  "Non-Sober", "Purchase Necessary", "Purchase Necessary", "No Purchase Necessary", "Not Child Friendly", "Average Lighting", "Transportation Close", "Transportation Close", "BIPOC Friendly", "Queer Friendly", "Responsive", "No Gender Neutral Restrooms"]
  elsif index % 3 == 0
    space.tags = ["Average Noise", "Studious", "Studious", "Studious", "Sad", "Sad", "Sad", "Accessible Entrance",  "Accessible Entrance", "No Customer Restrooms", "Parking", "No Parking", "Sober", "Non-Sober", "No Purchase Necessary", "Child Friendly", "Child Friendly", "Average Lighting", "No Transportation Close", "Not BIPOC Friendly", "Pushy", "Responsive", "Responsive", "No Gender Neutral Restrooms"]
  elsif index % 2 == 0
    space.tags = ["Quiet", "Studious", "Studious", "Sad", "Sad", "Not Accessible", "Accessible Entrance", "Not Accessible", "Customer Restrooms", "No Customer Restrooms", "No Customer Restrooms", "No Parking", "Sober", "Purchase Necessary", "Not Child Friendly", "Average Lighting", "Transportation Close", "No Transportation Close", "BIPOC Friendly", "BIPOC Friendly", "Queer Friendly", "Pushy", "No Gender Neutral Restrooms"]
  end

  space.save
end

ThirdSpace.all.each do |space|
  if space.tags != nil
    space.tags.map do |tag|
      space.markers.create!(name: tag)
    end
  end
end
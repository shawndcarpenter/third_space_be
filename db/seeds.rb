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
    space.tags = ["happy", "studious", "happy", "studious", "happy", "studious", "happy", "studious", "happy", "studious", "happy", "studious", "customer_restrooms", "parking", "parking", "parking", "sober", "no_purchase_necessary", "child_friendly", "child_friendly", "bright", "transportation_close", "bipoc_friendly", "queer_friendly", "respectful", "gender_neutral_restrooms", ]
  elsif index % 9 == 0
    space.tags = ["happy", "studious", "happy", "studious", "accessible", "accessible", "accessible", "accessible", "customer_restrooms", "customer_restrooms", "parking", "sober", "purchase_necessary", "purchase_necessary", "purchase_necessary", "child_friendly", "child_friendly",  "bright", "no_transportation_close", "bipoc_friendly", "queer_friendly", "respectful", "gender_neutral_restrooms", ]
  elsif index % 8 == 0
    space.tags = ["studious", "party", "party", "party", "not_accessible", "accessible", "customer_restrooms", "parking", "sober", "no_purchase_necessary", "no_purchase_necessary", "no_purchase_necessary", "bright","transportation_close", "bipoc_friendly", "respectful", "gender_neutral_restrooms", ]
  elsif index % 7 == 0
    space.tags = ["party", "party", "party", "party", "party", "party", "accessible", "accessible", "accessible", "no_customer_restrooms", "no_parking",  "no_parking", "sober", "purchase_necessary", "purchase_necessary", "no_purchase_necessary", "moody", "no_transportation_close", "queer_friendly", "responsive", "gender_neutral_restrooms", ]
  elsif index % 6 == 0
    space.tags = ["party", "party", "party", "not_accessible", "customer_restrooms",  "no_customer_restrooms", "parking", "no_parking",  "no_parking", "purchase_necessary", "purchase_necessary", "purchase_necessary", "not_child_friendly", "moody", "transportation_close", "bipoc_friendly", "responsive", "no_gender_neutral_restrooms", ]
  elsif index % 5 == 0
    space.tags = ["party", "sad", "sad", "sad", "sad", "accessible", "accessible", "accessible", "no_customer_restrooms", "no_parking",  "no_parking", "sober", "sober", "sober","purchase_necessary", "purchase_necessary", "purchase_necessary", "child_friendly", "child_friendly",  "moody", "no_transportation_close", "bipoc_friendly", "pushy", "no_gender_neutral_restrooms", ]
  elsif index % 4 == 0
    space.tags = ["party", "party", "party", "not_accessible", "accessible", "accessible", "customer_restrooms", "no_customer_restrooms",  "non_sober", "purchase_necessary", "purchase_necessary", "no_purchase_necessary", "not_child_friendly", "average_lighting", "transportation_close", "transportation_close", "bipoc_friendly", "queer_friendly", "responsive", "no_gender_neutral_restrooms", ]
  elsif index % 3 == 0
    space.tags = ["studious", "studious", "studious", "sad", "sad", "sad", "accessible",  "accessible", "no_customer_restrooms", "parking", "no_parking", "sober", "non_sober", "no_purchase_necessary", "child_friendly", "child_friendly", "average_lighting", "no_transportation_close", "non_bipoc_friendly", "pushy", "responsive", "responsive", "no_gender_neutral_restrooms", ]
  elsif index % 2 == 0
    space.tags = ["studious", "studious", "sad", "sad", "not_accessible", "accessible", "not_accessible", "customer_restrooms", "no_customer_restrooms", "no_customer_restrooms", "no_parking", "sober", "purchase_necessary", "not_child_friendly", "average_lighting", "transportation_close", "no_transportation_close", "bipoc_friendly", "bipoc_friendly", "queer_friendly", "pushy", "no_gender_neutral_restrooms", ]
  end

  space.save
end
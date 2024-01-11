# FactoryBot.define do
#   factory :third_space do
#     yelp_id { Faker::FunnyName.two_word_name }
#     name { Faker::Company.name }
#     address { Faker::Address.street_address }
#     rating { Faker::Number.decimal(l_digits: 2) }
#     phone { Faker::Number.number(digits: 10) }
#     photos { Faker::FunnyName.two_word_name }
#     lat { Faker::Number.decimal(l_digits: 2) }
#     lon { Faker::Number.decimal(l_digits: 2) }
#     price { Faker::String.random(length: 1..4) }
#     hours { Faker::FunnyName.two_word_name }
#     category { Faker::Restaurant.type }
#     open_now { Faker::Boolean.boolean }
#   end
# end

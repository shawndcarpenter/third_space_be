FactoryBot.define do
  factory :review_object do
    yelp_id { Faker::FunnyName.two_word_name }
    name { Faker::Company.name }
    rating { Faker::Number.decimal(l_digits: 2) }
    text { Faker::FunnyName.two_word_name }
  end

  factory :third_space do
    yelp_id { Faker::FunnyName.two_word_name }
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    rating { Faker::Number.decimal(l_digits: 2) }
    phone { Faker::Number.number(digits: 10) }
    photos { Faker::FunnyName.two_word_name }
    lat { Faker::Number.decimal(l_digits: 2) }
    lon { Faker::Number.decimal(l_digits: 2) }
    price { Faker::String.random(length: 1..4) }
    hours { Faker::FunnyName.two_word_name }
    category { Faker::Restaurant.type }

    factory :third_space_with_review_objects do
      transient do
        review_objects_count { 3 }
      end

      after(:create) do |third_space, context|
        create_list(:review_object, context.review_objects_count, third_space: third_space)

        third_space.reload
      end
    end
  end
end

# def third_space_with_review_objects(review_objects_count: 3)
#   FactoryBot.create(:third_space) do |third_space|
#     FactoryBot.create_list(:review_object, review_objects_count, third_space: third_space)
#   end

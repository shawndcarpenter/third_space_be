require 'rails_helper'


RSpec.describe "Search for reviews", type: :request do
 describe "Find reviews for a business", :vcr do
   it "will find reviews" do
    get "/api/v1/locations/5pWHnKN3_AIrXiyyqZ74pw/reviews"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:data)

    json[:data].each do |review|
      expect(review).to have_key(:id)
      expect(review[:id]).to be_a String
      expect(review).to have_key(:attributes)
      expect(review[:attributes]).to be_a Hash

      expect(review[:attributes]).to have_key(:rating)
      expect(review[:attributes][:rating]).to be_a Integer
      
      expect(review[:attributes]).to have_key(:yelp_id)
      expect(review[:attributes][:yelp_id]).to be_a String
      
      expect(review[:attributes]).to have_key(:text)
      expect(review[:attributes][:text]).to be_a String

      expect(review[:attributes]).to have_key(:name)
      expect(review[:attributes][:name]).to be_a String
    end
   end
 end
end

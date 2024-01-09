require 'rails_helper'


RSpec.describe "Search for reviews", type: :request do
 describe "Find reviews for a business", :vcr do
   it "will find reviews" do
     get "/api/v1/locations/5pWHnKN3_AIrXiyyqZ74pw/reviews"

     expect(response).to be_successful

     expect(response.status).to eq(200)
     json =  JSON.parse(response.body, symbolize_names: true)
   end
 end
end

require 'rails_helper'

RSpec.describe "Search for Spaces to Create", type: :request do
  describe "Find businesses" do
    it "will return an empty array if no businesses found", :vcr do
      search_params = create(:search_params, 
                        name: "Five Watt", 
                        city: "Denver")
      
      get search_locations_api_v1_locations_path, params: { name: search_params.name, city: search_params.city } 

      expect(response).to be_successful
      
      expect(response.status).to eq(200)
      json =  JSON.parse(response.body, symbolize_names: true)
      expect(json).to be_a Hash
      expect(json[:data]).to eq([])
    end
  end
  before :each do
    space_search_data
  end

  describe 'Find a Business' do
    it 'can successfully search for locations based on city and name search' do
      search_params = create(:search_params, 
                        name: "Five Watt", 
                        city: "Minneapolis")

      get search_locations_api_v1_locations_path, params: { name: search_params.name, city: search_params.city }

      expect(response).to be_successful
      
      expect(response.status).to eq(200)
      expect(@response_body).to be_a Hash
      
      expect(@data.length).to eq(14)
      
      result = @data.first
      expect(result).to have_key(:id)

      result = result[:attributes]
      expect(result[:id]).to eq("5pWHnKN3_AIrXiyyqZ74pw")

      expect(result).to have_key(:name)
      expect(result[:name]).to eq("Five Watt Coffee")
      expect(result).to have_key(:address)
      expect(result[:address]).to eq("3745 Nicollet Ave S, Minneapolis, MN 55409")
      expect(result).to have_key(:category)
      expect(result[:category]).to eq("Coffee & Tea")
    end
  end

end
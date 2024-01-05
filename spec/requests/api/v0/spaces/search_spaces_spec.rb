require 'rails_helper'

RSpec.describe "Search for Spaces to Create", type: :request do
  describe 'Find a Business' do
    it 'can successfully search for locations based on city and name search' do
      search_params = create(:search_params, 
                        name: "Five Watt", 
                        city: "Minneapolis")

      get api_v0_search_spaces_path, params: { name: search_params.name, city: search_params.city }

      expect(response).to be_successful
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(response_body).to be_a Array

      data = response_body[:data]
      expect(data.length).to eq(10)

      atm = data.first 
      expect(atm).to have_key(:id)

      atm = data.first[:attributes]
      expect(atm[:id]).to be_nil
  
      expect(atm).to have_key(:name)
      expect(atm[:name]).to eq("ATM")
      expect(atm[:address]).to eq("3902 Central Avenue Southeast, Albuquerque, NM 87108")
      expect(atm[:lat]).to eq(35.079044)
      expect(atm[:lon]).to eq(-106.60068)
      expect(atm[:distance]).to eq(169.766658)
    end
  end

end
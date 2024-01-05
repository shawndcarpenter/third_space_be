require 'rails_helper'

RSpec.describe "Create a Third Space", type: :request do
  before :each do
    space_search_data
  end

  describe 'Take the ID of previously searched location and create third space entry' do
    xit 'can create a third space entry and store into database' do
      selected_entry = create(:search_params, 
                        name: "Five Watt", 
                        city: "Minneapolis")

      # get api_v0_search_spaces_path, params: { name: search_params.name, city: search_params.city }

      # expect(response).to be_successful
      
      # response_body = JSON.parse(response.body, symbolize_names: true)

      # expect(response.status).to eq(200)
      # expect(response_body).to be_a Hash
      
      # data = response_body[:data]

      # expect(data.length).to eq(14)

      # result = data.first
      # expect(result).to have_key(:id)

      # result = data.first[:attributes]
      # expect(result[:id]).to eq("5pWHnKN3_AIrXiyyqZ74pw")

      # expect(result).to have_key(:name)
      # expect(result[:name]).to eq("Five Watt Coffee")
      # expect(result).to have_key(:address)
      # expect(result[:address]).to eq("3745 Nicollet Ave S, Minneapolis, MN, 55409")
      # expect(result).to have_key(:category)
      # expect(result[:category]).to eq("Coffee & Tea")
    end
  end

end
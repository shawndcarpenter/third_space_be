require 'rails_helper'

RSpec.describe "Create a Third Space", type: :request do
  before :each do
    space_search_data

    json_response = File.read('spec/fixtures/five_watt_details.json')
    stub_request(:get, "https://api.yelp.com/v3/businesses/5pWHnKN3_AIrXiyyqZ74pw").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>"#{Rails.application.credentials.yelp[:key]}",
          'User-Agent'=>'Faraday v2.8.1'
           }).
         to_return(status: 200, body: json_response, headers: {})
  end

  describe 'Take the ID of previously searched location and create third space entry' do
    it 'can create a third space entry and store into database' do
      selected_entry = @result

      get create_third_space_api_v0_spaces_path, params: { id: selected_entry[:id]}

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
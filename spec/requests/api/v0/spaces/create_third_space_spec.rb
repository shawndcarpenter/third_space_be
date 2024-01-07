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
    xit 'can create a third space entry and store into database' do
      selected_entry = @result

      post api_v1_third_spaces_path, params: { id: selected_entry[:id]}

      expect(response).to be_successful
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(response_body).to be_a Hash
      
      data = response_body[:data]

      expect(data.length).to eq(3)
      binding.pry
      expect(data[:id]).to eq("5")

      result = data[:attributes]
      expect(result[:yelp_id]).to eq("5pWHnKN3_AIrXiyyqZ74pw")

      expect(result).to have_key(:name)
      expect(result[:name]).to eq("Five Watt Coffee")

      expect(result).to have_key(:address)
      expect(result[:address]).to eq("3745 Nicollet Ave S, Minneapolis, MN 55409")

      expect(result).to have_key(:category)
      expect(result[:category]).to eq("Coffee & Tea")

      expect(result).to have_key(:rating)
      expect(result[:rating]).to eq(4.5)

      expect(result).to have_key(:phone)
      expect(result[:phone]).to eq("(612) 259-7519")

      expect(result).to have_key(:photos)
      expect(result[:photos]).to eq(["https://s3-media2.fl.yelpcdn.com/bphoto/AyfUwUHqBKUHRtDMK8iPJw/o.jpg", "https://s3-media3.fl.yelpcdn.com/bphoto/6Aq6taDnd1eSbwNYcD2KtA/o.jpg", "https://s3-media3.fl.yelpcdn.com/bphoto/kypW8wYUYF2WgqJ9_3M7lQ/o.jpg"])

      expect(result).to have_key(:lat)
      expect(result[:lat]).to eq(44.934479)

      expect(result).to have_key(:lon)
      expect(result[:lon]).to eq(-93.277771)

      expect(result).to have_key(:tags)
      expect(result[:tags]).to eq([])

      expect(result).to have_key(:price)
      expect(result[:price]).to eq("$$")

      expect(result).to have_key(:hours)
      expect(result[:hours]).to be_an(Array)

      expect(result).to have_key(:open_now)
      expect(result[:open_now]).to eq(false)
    end
  end

end
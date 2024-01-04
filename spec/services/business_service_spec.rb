require 'rails_helper'

RSpec.describe LocationSearchService, :vcr do
  before :each do
    business_params = ({
      name: "Upper Crust Pizza & Pasta in Soquel Hill",
      street: "2501 Soquel Drive",
      city: "Santa Cruz",
      county: "Santa Cruz",
      state: "California",
      zip: "95065",
      lat: "36.988429",
      lon: "-121.974731"
    })
      headers = {"CONTENT_TYPE" => "application/json"}

      business = Business.create!(business_params)

      stub_request(:get, "https://api.tomtom.com/search/2/categorySearch/automatic_teller_machine.json?key=#{ENV["API_KEY"]}&lat=35.077529&lon=-106.600449&municipality=Albuquerque&streetName=Lead%20%26%20Morningside%20SE").
      with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.12'
        }).
      to_return(status: 200, body: atms_near_nob_hill_fixture, headers: {})
      @search = AtmSearchService.new.find_atm(market)
  end

  context "" do

  end
end
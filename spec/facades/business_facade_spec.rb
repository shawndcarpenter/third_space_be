require 'rails_helper'

describe BusinessFacade do
  context "class methods" do
    context "#businesses" do
      before :each do
        # Mock data representing query parameters
        query_params = {
          lat: "35.0000",
          lon: "-106.0000"
        }

        # Mock API response data
        businesses_near_location_fixture = File.read("spec/fixtures/businesses_near_location.json")
        stub_request(:get, "https://api.example.com/search/businesses?key=#{ENV['API_KEY']}&lat=#{query_params[:lat]}&lon=#{query_params[:lon]}").
          to_return(status: 200, body: businesses_near_location_fixture, headers: {})

        @facade = BusinessFacade.new(query_params)
      end

      it "exists" do
        expect(@facade).to be_a(BusinessFacade)
      end

      it "can create poros of businesses based on API response" do
        businesses = @facade.businesses
        expect(businesses).to all( be_a(Business) )

        businesses.each do |business|
          expect(business).to respond_to(:name)
          expect(business).to respond_to(:address)
          expect(business).to respond_to(:lat)
          expect(business).to respond_to(:lon)
        end
      end
    end
  end
end

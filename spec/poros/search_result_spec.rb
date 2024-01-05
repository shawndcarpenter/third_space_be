require "rails_helper"

RSpec.describe SearchResult do
  it "exists" do
    attrs = {
      "id": "f-m7-hyFzkf0HSEeQ2s-9A",
      "alias": "fog-harbor-fish-house-san-francisco-2",
      "name": "Fog Harbor Fish House",
      "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/by8Hh63BLPv_HUqRUdsp_w/o.jpg",
      "is_closed": false,
      "url": "https://www.yelp.com/biz/fog-harbor-fish-house-san-francisco-2?adjust_creative=WR8j6bjFy9ZvXPCb5KGzFw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=WR8j6bjFy9ZvXPCb5KGzFw",
      "review_count": 10056,
      "categories": [
          {
              "alias": "seafood",
              "title": "Seafood"
          },
          {
              "alias": "wine_bars",
              "title": "Wine Bars"
          },
          {
              "alias": "cocktailbars",
              "title": "Cocktail Bars"
          }
      ],
      "rating": 4.5,
      "coordinates": {
          "latitude": 37.80889,
          "longitude": -122.41025
      },
      "transactions": [
          "restaurant_reservation"
      ],
      "price": "$$",
      "location": {
          "address1": "39 Pier",
          "address2": "Ste 202A",
          "address3": "",
          "city": "San Francisco",
          "zip_code": "94133",
          "country": "US",
          "state": "CA",
          "display_address": [
              "39 Pier",
              "Ste 202A",
              "San Francisco, CA 94133"
          ]
      },
      "phone": "+14159692010",
      "display_phone": "(415) 969-2010",
      "distance": 5804.678003375963
  }

    search = SearchResult.new(attrs)

    expect(search).to be_a SearchResult
    expect(search.name).to eq("Fog Harbor Fish House")
    expect(search.address).to eq("39 Pier, Ste 202A, San Francisco, CA 94133")
    expect(search.category).to eq("Seafood")
    expect(search.id).to eq("f-m7-hyFzkf0HSEeQ2s-9A")
  end
end
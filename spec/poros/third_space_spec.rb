require "rails_helper"

RSpec.describe ThirdSpace do
  it "exists" do
    attrs = {
      "id": "f-m7-hyFzkf0HSEeQ2s-9A",
      "alias": "fog-harbor-fish-house-san-francisco-2",
      "name": "Fog Harbor Fish House",
      "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/by8Hh63BLPv_HUqRUdsp_w/o.jpg",
      "is_claimed": true,
      "is_closed": false,
      "url": "https://www.yelp.com/biz/fog-harbor-fish-house-san-francisco-2?adjust_creative=WR8j6bjFy9ZvXPCb5KGzFw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=WR8j6bjFy9ZvXPCb5KGzFw",
      "phone": "+14159692010",
      "display_phone": "(415) 969-2010",
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
          ],
          "cross_streets": ""
      },
      "coordinates": {
          "latitude": 37.80889,
          "longitude": -122.41025
      },
      "photos": [
          "https://s3-media2.fl.yelpcdn.com/bphoto/by8Hh63BLPv_HUqRUdsp_w/o.jpg",
          "https://s3-media2.fl.yelpcdn.com/bphoto/cc5tnzyd03couTo7ReDGgQ/o.jpg",
          "https://s3-media3.fl.yelpcdn.com/bphoto/J5NJ8-gclvTMzVmp3OrckA/o.jpg"
      ],
      "price": "$$",
      "hours": [
          {
              "open": [
                  {
                      "is_overnight": false,
                      "start": "1100",
                      "end": "2100",
                      "day": 0
                  },
                  {
                      "is_overnight": false,
                      "start": "1100",
                      "end": "2100",
                      "day": 1
                  },
                  {
                      "is_overnight": false,
                      "start": "1100",
                      "end": "2100",
                      "day": 2
                  },
                  {
                      "is_overnight": false,
                      "start": "1100",
                      "end": "2100",
                      "day": 3
                  },
                  {
                      "is_overnight": false,
                      "start": "1100",
                      "end": "2100",
                      "day": 4
                  },
                  {
                      "is_overnight": false,
                      "start": "1100",
                      "end": "2100",
                      "day": 5
                  },
                  {
                      "is_overnight": false,
                      "start": "1100",
                      "end": "2100",
                      "day": 6
                  }
              ],
              "hours_type": "REGULAR",
              "is_open_now": true
          }
      ],
      "transactions": [
          "restaurant_reservation"
      ],
      "messaging": {
          "url": "https://www.yelp.com/raq/f-m7-hyFzkf0HSEeQ2s-9A?adjust_creative=WR8j6bjFy9ZvXPCb5KGzFw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=WR8j6bjFy9ZvXPCb5KGzFw#popup%3Araq",
          "use_case_text": "Message the Business"
      }
  }

    search = ThirdSpacePoro.new(attrs)

    expect(search).to be_a ThirdSpacePoro
    expect(search.address).to be_a(String)
    expect(search.category).to be_a(String)
    expect(search.lat).to be_a(Float)
    expect(search.lon).to be_a(Float)
    expect(search.name).to be_a(String)
    expect(search.phone).to be_a(String)
    expect(search.photos).to be_a(Array)
    expect(search.price).to be_a(String)
    expect(search.rating).to be_a(Float)
    expect(search.tags).to eq(nil)
    expect(search.yelp_id).to be_a(String)
  end
end
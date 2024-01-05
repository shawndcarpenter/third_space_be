require 'rails_helper'

RSpec.describe ThirdSpace, type: :poro do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = {
        id: "yelp-id-123",
        name: "Bowling Greens",
        location: {
          display_address: ["365 Alley Way", "Los Angeles", "CA", "92832"]
        },
        rating: 4.5,
        display_phone: "123-456-7890",
        photos: ["http://example.com/photo1.jpg"],
        coordinates: {
          latitude: 40.7128,
          longitude: -74.0060
        },
        price: "$$",
        hours: [{ is_open_now: true }],
        categories: [{ title: "New American" }]
      }

      third_space = ThirdSpace.new(data)

      expect(third_space).to be_a(ThirdSpace)
      expect(third_space.yelp_id).to eq("yelp-id-123")
      expect(third_space.name).to eq("Bowling Greens")
      expect(third_space.address).to eq("365 Alley Way, Los Angeles, CA, 92832")
      expect(third_space.rating).to eq(4.5)
      expect(third_space.phone).to eq("123-456-7890")
      expect(third_space.photos).to eq(["http://example.com/photo1.jpg"])
      expect(third_space.lat).to eq(40.7128)
      expect(third_space.lon).to eq(-74.0060)
      expect(third_space.price).to eq("$$")
      expect(third_space.hours).to eq([{ is_open_now: true }])
      expect(third_space.open_now).to eq(true)
      expect(third_space.category).to eq("New American")
      expect(third_space.tags).to eq([])
    end
  end
end
require 'rails_helper'

RSpec.describe SpaceCreateFacade, type: :facade do
  describe '#get_space_details' do
    it 'retrieves space details and creates a ThirdSpace object' do
      # mock & stub api call
      service = instance_double('SpaceCreateService')
      allow(SpaceCreateService).to receive(:new).and_return(service)

      fake_response = instance_double('Faraday::Response')
      allow(service).to receive(:get_space_details).and_return(fake_response)

      sample_json = {
        id: "yelp-id-123",
        name: "Bowling Greens",
        location: { display_address: ["365 Alley Way", "Los Angeles", "CA", "92832"] },
        rating: 4.5,
        display_phone: "123-456-7890",
        photos: ["http://example.com/photo1.jpg"],
        coordinates: { latitude: 40.7128, longitude: -74.0060 },
        price: "$$",
        hours: [{ is_open_now: true }],
        categories: [{ title: "New American" }]
      }.to_json

      allow(fake_response).to receive(:body).and_return(sample_json)

      facade = SpaceCreateFacade.new
      third_space = facade.get_space_details('yelp-id-123')

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
      expect(third_space.category).to eq("New American")
      expect(third_space.tags).to eq([])
      expect(third_space.open_now).to eq(true)
    end
  end
end
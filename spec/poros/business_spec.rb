require "rails_helper"

RSpec.describe Business, type: :model do
  describe '#initialize' do
  it 'correctly initializes a Business with attributes' do
    business_data = {
      poi: {
        name: 'Test Business'
      },
      address: {
        streetNumber: '123',
        streetName: 'Test Street',
        municipality: 'Test City',
        countrySubdivision: 'Test State',
        postalCode: '12345'
      },
      position: {
        lat: 10.0,
        lon: 20.0
      }
    }

    business = Business.new(business_data)

    expect(business.name).to eq('Test Business')
    expect(business.address).to eq('123 Test Street, Test City, Test State 12345')
    expect(business.lat).to eq(10.0)
    expect(business.lon).to eq(20.0)
  end
end
end
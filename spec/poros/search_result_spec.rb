require 'rails_helper'

RSpec.describe SearchResult, type: :poro do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = {
        id: "123",
        name: "Bowling Greens",
        location: {
          display_address: ["365 Alley Way", "Los Angeles", "CA", "92832"]
        },
        categories: [{ title: "New American" }]
      }

      search_result = SearchResult.new(data)

      expect(search_result).to be_a(SearchResult)
      expect(search_result.id).to eq("123")
      expect(search_result.name).to eq("Bowling Greens")
      expect(search_result.address).to eq("365 Alley Way, Los Angeles, CA, 92832")
      expect(search_result.category).to eq("New American")
    end
  end
end

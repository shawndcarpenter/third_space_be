require 'rails_helper'

RSpec.describe SearchResultSerializer do
  describe 'serialization' do
    it 'serializes SearchResult objects correctly' do
      search_result = SearchResult.new(
        id: '123',
        name: 'Bowling Green',
        location: {
          display_address: ['365 Alley Way', 'Los Angeles', 'CA', '92832'],
        },
        categories: [{ title: 'New American' }]
      )

      serialized_result = SearchResultSerializer.new(search_result).serializable_hash

      expect(serialized_result).to be_a(Hash)

      expect(serialized_result[:data][:id]).to eq('123')
      expect(serialized_result[:data][:type]).to eq(:search_result)
      expect(serialized_result[:data][:attributes]).to include(
        name: 'Bowling Green',
        address: '365 Alley Way, Los Angeles, CA, 92832',
        category: 'New American'
      )
    end
  end
end
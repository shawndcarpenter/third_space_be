require 'rails_helper'

RSpec.describe "Create New Third Spaces", type: :request do
  describe 'Find a Business and Create a Third Space' do
    it 'can create a new third space through search of location' do
      search_params = create(:search_params, 
                        name: "Five Watt", 
                        city: "Minneapolis")

      get api_v0_search_spaces_path, params: { name: search_params.name, city: search_params.city }

      expect(response).to be_successful
      binding.pry
    end
  end

end
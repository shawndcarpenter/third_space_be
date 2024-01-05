require 'rails_helper'

RSpec.describe "Create New Third Spaces", type: :request do
  describe 'Find a Business and Create a Third Space' do
    it 'can create a new third space through search of location' do
      create_search = create(:search_params, 
                        name: "Five Watt", 
                        city: "Minneapolis")

      get api_v0_search_spaces_path

      expect(response).to be_successful
      binding.pry
    end
  end

end
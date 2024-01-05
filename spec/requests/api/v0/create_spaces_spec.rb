require 'rails_helper'

RSpec.describe "Create New Third Spaces", type: :request do
  describe 'Find a Business and Create a Third Space' do
    it 'can create a new third space through search of location' do
      # location = create(:search_params, 
      #                   name: "Five Watt", 
      #                   city: "Minneapolis")

      get api_v0_create_spaces_path
      binding.pry

      expect(response).to be_successful
    end
  end

end
require 'rails_helper'

RSpec.describe "Nearest Spaces Search", type: :request do
  describe 'Get Spaces Near a Specified Lat/Lon' do
    it 'can return nearby spaces based on the user specified lat and lon' do
      # lat = "35.077529"
      # lon = "-106.600449"
      get api_v0_nearest_spaces_path
      binding.pry

      expect(response).to be_successful
    end
  end

end
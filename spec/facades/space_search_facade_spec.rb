require "rails_helper"

RSpec.describe SpaceSearchFacade do
  
  it "#get search results", :vcr do
    name = "Five Watt", 
    city = "Minneapolis"
    search_results = SpaceSearchFacade.new.get_search_results(name, city)
    expect(search_results).to be_a(Array)
    search_results.each do |location|
      expect(location.address).to be_a(String)
      expect(location.category).to be_a(String)
      expect(location.id).to be_a(String)
      expect(location.name).to be_a(String)
    end
  end

  xit 'parses json data' do
    space_search_data
    # not sure about this one, how to set it up
  end
end
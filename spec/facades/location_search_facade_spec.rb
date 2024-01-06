require "rails_helper"

RSpec.describe LocationSearchFacade do  
  it "#get search results", :vcr do
    name = "Five Watt", 
    city = "Minneapolis"
    search_results = LocationSearchFacade.new(name, city).locations

    expect(search_results).to be_a(Array)
    search_results.each do |location|
      expect(location.address).to be_a(String)
      expect(location.category).to be_a(String)
      expect(location.id).to be_a(String)
      expect(location.name).to be_a(String)
    end
  end
end
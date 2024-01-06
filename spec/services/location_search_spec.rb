require 'rails_helper'

describe LocationSearchService do
  context "instance methods" do
    context "#get_search_results" do
      it "connects", :vcr do
        service = LocationSearchService.new 
        expect(service.conn).to be_instance_of Faraday::Connection
      end

      it "returns parsed results", :vcr do
        name = "Five Watt", 
        city = "Minneapolis"
        search = LocationSearchService.new.find_locations(name, city)
        expect(search.first).to be_a Hash
      end
    end
  end
end
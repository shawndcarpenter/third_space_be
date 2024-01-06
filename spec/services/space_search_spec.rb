require 'rails_helper'

describe SpaceSearchService do
  context "instance methods" do
    context "#get_search_results" do
      it "connects", :vcr do
        service = SpaceSearchService.new 
        expect(service.conn).to be_instance_of Faraday::Connection
      end

      it "searches a specific endpoint", :vcr do
        name = "Five Watt", 
        city = "Minneapolis"
        search = SpaceSearchService.new.get_search_results(name, city)
        expect(search).to be_a Faraday::Response
      end
    end
  end
end
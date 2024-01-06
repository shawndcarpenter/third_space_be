require 'rails_helper'

describe SpaceCreateService do
  context "instance methods" do
    context "#get_space_details" do
      it "connects", :vcr do
        service = SpaceCreateService.new 
        expect(service.conn).to be_instance_of Faraday::Connection
      end

      it "searches a specific id", :vcr do
        id = "f-m7-hyFzkf0HSEeQ2s-9A"
        search = SpaceCreateService.new.get_space_details(id)
        expect(search).to be_a Faraday::Response
      end
    end
  end
end
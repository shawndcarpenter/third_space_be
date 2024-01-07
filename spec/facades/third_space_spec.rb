require "rails_helper"

RSpec.describe ThirdSpaceFacade do
  
  it "#get search results", :vcr do
    id = "f-m7-hyFzkf0HSEeQ2s-9A"
    search_results = ThirdSpaceFacade.new.get_space_details(id)
    #search_results is neither an array nor a hash but a custom-instantiated object known as ThirdSpace
    expect(search_results.first.address).to be_a(String)
    expect(search_results.first.category).to be_a(String)
    expect(search_results.first.hours).to be_a(Array)
    expect(search_results.first.lat).to be_a(Float)
    expect(search_results.first.lon).to be_a(Float)
    expect(search_results.first.name).to be_a(String)
    expect(search_results.first.open_now).to be_a(TrueClass).or be_a(FalseClass)
    expect(search_results.first.phone).to be_a(String)
    expect(search_results.first.photos).to be_a(Array)
    expect(search_results.first.price).to be_a(String)
    expect(search_results.first.rating).to be_a(Float)
    expect(search_results.first.tags).to eq([])
    expect(search_results.first.yelp_id).to be_a(String)
  end
end
require 'rails_helper'

describe "Third Places SEARCH API Endpoint" do
  before(:each) do
    @space_1 = create(:third_space)
    @space_2 = create(:third_space)
    @space_3 = create(:third_space)
    @space_4 = create(:third_space)
    @space_5 = create(:third_space)
    @space_6 = create(:third_space)

    @space_1_params = ({
      tags: ["happy"],
      volume: ["quiet"], 
      accessible_entrance: ["no"], 
      customer_restrooms: ["no"], 
      parking: ["yes"], 
      purchase_necessary: ["yes"], 
      sober: ["no"], 
      child_friendly: ["yes"], 
      light_level: ["low"], 
      public_transportation_nearby: ["no"], 
      bipoc_friendly: ["yes"], 
      queer_friendly: ["yes"], 
      staff_responsiveness: ["pushy"],
      gender_neutral_restrooms: ["no"]
    })

    @space_2_params = ({
      tags: ["studious"],
      volume: ["loud"], 
      accessible_entrance: ["no"], 
      customer_restrooms: ["no"], 
      parking: ["yes"], 
      purchase_necessary: ["yes"], 
      sober: ["no"], 
      child_friendly: ["yes"], 
      light_level: ["low"], 
      public_transportation_nearby: ["no"], 
      bipoc_friendly: ["yes"], 
      queer_friendly: ["yes"], 
      staff_responsiveness: ["pushy"],
      gender_neutral_restrooms: ["no"]
    })

    @space_3_params = ({
      tags: ["studious"],
      volume: ["loud"], 
      accessible_entrance: ["no"], 
      customer_restrooms: ["no"], 
      parking: ["yes"], 
      purchase_necessary: ["yes"], 
      sober: ["no"], 
      child_friendly: ["yes"], 
      light_level: ["low"], 
      public_transportation_nearby: ["no"], 
      bipoc_friendly: ["yes"], 
      queer_friendly: ["yes"], 
      staff_responsiveness: ["pushy"],
      gender_neutral_restrooms: ["no"]
    })

    @space_4_params = ({
      tags: ["studious"],
      volume: ["quiet"], 
      accessible_entrance: ["no"], 
      customer_restrooms: ["no"], 
      parking: ["yes"], 
      purchase_necessary: ["yes"], 
      sober: ["no"], 
      child_friendly: ["yes"], 
      light_level: ["low"], 
      public_transportation_nearby: ["no"], 
      bipoc_friendly: ["yes"], 
      queer_friendly: ["yes"], 
      staff_responsiveness: ["pushy"],
      gender_neutral_restrooms: ["no"]
    })

    @space_5_params = ({
      tags: ["happy"],
      volume: ["loud"], 
      accessible_entrance: ["no"], 
      customer_restrooms: ["no"], 
      parking: ["yes"], 
      purchase_necessary: ["yes"], 
      sober: ["no"], 
      child_friendly: ["yes"], 
      light_level: ["low"], 
      public_transportation_nearby: ["no"], 
      bipoc_friendly: ["yes"], 
      queer_friendly: ["yes"], 
      staff_responsiveness: ["pushy"],
      gender_neutral_restrooms: ["no"]
    })

    @space_6_params = ({
      tags: ["happy", "studious", "studious", "studious", "studious", "studious"],
      volume: ["quiet"], 
      accessible_entrance: ["no"], 
      customer_restrooms: ["no"], 
      parking: ["yes"], 
      purchase_necessary: ["yes"], 
      sober: ["no"], 
      child_friendly: ["yes"], 
      light_level: ["low"], 
      public_transportation_nearby: ["no"], 
      bipoc_friendly: ["yes"], 
      queer_friendly: ["yes"], 
      staff_responsiveness: ["pushy"],
      gender_neutral_restrooms: ["no"]
    })

    patch "/api/v1/third_spaces/#{@space_1.id}", params: @space_1_params
    patch "/api/v1/third_spaces/#{@space_2.id}", params: @space_2_params
    patch "/api/v1/third_spaces/#{@space_3.id}", params: @space_3_params
    patch "/api/v1/third_spaces/#{@space_4.id}", params: @space_4_params
    patch "/api/v1/third_spaces/#{@space_5.id}", params: @space_5_params
    patch "/api/v1/third_spaces/#{@space_6.id}", params: @space_6_params
  end

  it "sends a list of third places matching criteria" do
    get '/api/v1/third_spaces/search?tags=happy&volume=loud'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]
    space = third_spaces.first
    # binding.pry
    expect(third_spaces.count).to eq(1)
    expect(space[:attributes][:markers][0][:tags]).to eq(@space_5_params[:tags])
    expect(space[:attributes][:markers][0][:volume]).to eq(@space_5_params[:volume])
    expect(space[:attributes][:markers][0][:accessible_entrance]).to eq(@space_5_params[:accessible_entrance])
  end

  it "sends a list of third places when a place contains multiple tags" do
    get '/api/v1/third_spaces/search?tags=studious'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]
    space = third_spaces.first
    # binding.pry
    expect(third_spaces.count).to eq(4)
  end
end
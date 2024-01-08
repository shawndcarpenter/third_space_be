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
    
    expect(space).to have_key(:id)

    expect(space).to have_key(:type)
    expect(space[:type]).to be_a(String)
    expect(space[:type]).to eq("third_space")

    expect(space).to have_key(:attributes)
    expect(space[:attributes]).to be_an(Hash)

    expect(space[:attributes]).to have_key(:yelp_id)
    expect(space[:attributes][:yelp_id]).to be_a(String)

    expect(space[:attributes]).to have_key(:name)
    expect(space[:attributes][:name]).to be_a(String)

    expect(space[:attributes]).to have_key(:address)
    expect(space[:attributes][:address]).to be_a(String)

    expect(space[:attributes]).to have_key(:rating)
    expect(space[:attributes][:rating]).to be_a(Float)

    expect(space[:attributes]).to have_key(:phone)
    expect(space[:attributes][:phone]).to be_a(String)

    expect(space[:attributes]).to have_key(:photos)
    expect(space[:attributes][:photos]).to be_a(Array)

    expect(space[:attributes]).to have_key(:lat)
    expect(space[:attributes][:lat]).to be_a(Float)

    expect(space[:attributes]).to have_key(:lon)
    expect(space[:attributes][:lon]).to be_a(Float)

    expect(space[:attributes]).to have_key(:price)
    expect(space[:attributes][:price]).to be_a(String)

    expect(space[:attributes]).to have_key(:hours)
    expect(space[:attributes][:hours]).to be_a(String)

    expect(space[:attributes]).to have_key(:category)
    expect(space[:attributes][:category]).to be_a(String)

    expect(space[:attributes]).to have_key(:open_now)
    expect(space[:attributes][:open_now]).to be_a(TrueClass).or be_a(FalseClass)  
  end

  it "sends a list of third places when a place contains multiple tags" do
    get '/api/v1/third_spaces/search?tags=studious'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(third_spaces.count).to eq(4)

    third_spaces.each do |space|
      expect(space).to have_key(:id)

      expect(space).to have_key(:type)
      expect(space[:type]).to be_a(String)
      expect(space[:type]).to eq("third_space")

      expect(space).to have_key(:attributes)
      expect(space[:attributes]).to be_an(Hash)

      expect(space[:attributes]).to have_key(:yelp_id)
      expect(space[:attributes][:yelp_id]).to be_a(String)

      expect(space[:attributes]).to have_key(:name)
      expect(space[:attributes][:name]).to be_a(String)

      expect(space[:attributes]).to have_key(:address)
      expect(space[:attributes][:address]).to be_a(String)

      expect(space[:attributes]).to have_key(:rating)
      expect(space[:attributes][:rating]).to be_a(Float)

      expect(space[:attributes]).to have_key(:phone)
      expect(space[:attributes][:phone]).to be_a(String)

      expect(space[:attributes]).to have_key(:photos)
      expect(space[:attributes][:photos]).to be_a(Array)

      expect(space[:attributes]).to have_key(:lat)
      expect(space[:attributes][:lat]).to be_a(Float)

      expect(space[:attributes]).to have_key(:lon)
      expect(space[:attributes][:lon]).to be_a(Float)

      expect(space[:attributes]).to have_key(:price)
      expect(space[:attributes][:price]).to be_a(String)

      expect(space[:attributes]).to have_key(:hours)
      expect(space[:attributes][:hours]).to be_a(String)

      expect(space[:attributes]).to have_key(:category)
      expect(space[:attributes][:category]).to be_a(String)

      expect(space[:attributes]).to have_key(:open_now)
      expect(space[:attributes][:open_now]).to be_a(TrueClass).or be_a(FalseClass)
    end
  end

  it "sends a list of third places when a place contains multiple tags" do
    search_params = ({public_transportation_nearby: "no",
              bipoc_friendly: "yes"
              })
    get '/api/v1/third_spaces/search', params: search_params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(third_spaces.count).to eq(6)
  end
end
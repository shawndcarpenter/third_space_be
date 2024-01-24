require 'rails_helper'

describe "Third Places SEARCH API Endpoint" do
  before(:each) do
    @space_1 = create(:third_space)
    @space_2 = create(:third_space)
    @space_3 = create(:third_space)
    @space_4 = create(:third_space)
    @space_5 = create(:third_space)
    @space_6 = create(:third_space)
    @space_1.update!(yelp_id: "12345")
    @space_2.update!(yelp_id: "23456")
    @space_3.update!(yelp_id: "34567")
    @space_4.update!(yelp_id: "45678")
    @space_5.update!(yelp_id: "56789")
    @space_6.update!(yelp_id: "67890")

    @space_1_params = ({
      tags: ["happy"]
    })

    @space_2_params = ({
      tags: ["studious"]
    })

    @space_3_params = ({
      tags: ["studious"]
    })

    @space_4_params = ({
      tags: ["studious"]
    })

    @space_5_params = ({
      tags: ["happy"]
    })

    @space_6_params = ({
      tags: ["happy", "studious", "studious", "studious", "studious", "studious"]
    })

    patch "/api/v1/third_spaces/#{@space_1.yelp_id}", params: @space_1_params
    patch "/api/v1/third_spaces/#{@space_2.yelp_id}", params: @space_2_params
    patch "/api/v1/third_spaces/#{@space_3.yelp_id}", params: @space_3_params
    patch "/api/v1/third_spaces/#{@space_4.yelp_id}", params: @space_4_params
    patch "/api/v1/third_spaces/#{@space_5.yelp_id}", params: @space_5_params
    patch "/api/v1/third_spaces/#{@space_6.yelp_id}", params: @space_6_params
  end

  it "sends a list of third places matching criteria" do
    get '/api/v1/third_spaces/search', params: ({tags: ["happy"]})

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]
    space = third_spaces.first
    # binding.pry
    expect(third_spaces.count).to eq(3)
    
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
    expect(space[:attributes][:photos]).to be_a(String)

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
  end

  it "sends a list of third places when a place contains multiple tags" do
    get '/api/v1/third_spaces/search?', params: ({tags: ["studious", "happy"]})

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(third_spaces.count).to eq(2)

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
      expect(space[:attributes][:photos]).to be_a(String)

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
    end
  end

  it "will return an empty array when no spaces found" do
    get '/api/v1/third_spaces/search?', params: ({tags: ["annoying"]})

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(third_spaces.count).to eq(0)
  end

  it "will return third spaces matching names" do
    get '/api/v1/third_spaces/search_by_name?', params: ({name: @space_1.name})

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(third_spaces.count).to eq(1)
    space = third_spaces.first
    expect(space).to have_key(:id)

    expect(space).to have_key(:type)
    expect(space[:type]).to be_a(String)
    expect(space[:type]).to eq("third_space")

    expect(space).to have_key(:attributes)
    expect(space[:attributes]).to be_an(Hash)

    expect(space[:attributes]).to have_key(:yelp_id)
    expect(space[:attributes][:yelp_id]).to be_a(String)
    expect(space[:attributes][:yelp_id]).to eq(@space_1.yelp_id)

    expect(space[:attributes]).to have_key(:name)
    expect(space[:attributes][:name]).to be_a(String)
    expect(space[:attributes][:name]).to eq(@space_1.name)

    expect(space[:attributes]).to have_key(:address)
    expect(space[:attributes][:address]).to be_a(String)
    expect(space[:attributes][:address]).to eq(@space_1.address)

    expect(space[:attributes]).to have_key(:rating)
    expect(space[:attributes][:rating]).to be_a(Float)

    expect(space[:attributes]).to have_key(:phone)
    expect(space[:attributes][:phone]).to be_a(String)

    expect(space[:attributes]).to have_key(:photos)
    expect(space[:attributes][:photos]).to be_a(String)

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
  end
end
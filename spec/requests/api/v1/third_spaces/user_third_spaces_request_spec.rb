require 'rails_helper'

describe "Get Third Places API Endpoint" do
  it "sends a list of user third places" do
    user = User.create!
    user_2 = User.create!
    user.third_spaces = FactoryBot.create_list(:third_space, 5)
    user_2.third_spaces = FactoryBot.create_list(:third_space, 2)

    
    get "/api/v1/users/#{user.id}/third_spaces"
    
    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    third_spaces = JSON.parse(response.body, symbolize_names: true)[:included]
 
    expect(third_spaces.count).to eq(5)

    third_spaces.each do |space|
      expect(space).to have_key(:id)
      expect(space[:id]).to_not eq(user_2.third_spaces.first[:id])

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

  it "can add a user third space" do
    user = User.create!
    space = create(:third_space)

    expect(user.third_spaces).to_not include(space)
    user_third_space_params =  {
      user_id: user.id,
      third_space_id: space.id
    }   

    post "/api/v1/user_third_spaces", params: user_third_space_params
    
    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:included]
    user_space = third_spaces.first
 
    expect(third_spaces.count).to eq(1)
    expect(user_space[:attributes][:yelp_id]).to eq(space.yelp_id)
    expect(user_space[:attributes][:name]).to eq(space.name)
    expect(user_space[:attributes][:address]).to eq(space.address)
    expect(user_space[:attributes][:rating]).to eq(space.rating)
    expect(user_space[:attributes][:phone]).to eq(space.phone)
    expect(user_space[:attributes][:photos]).to eq(space.photos)
    expect(user_space[:attributes][:lat]).to eq(space.lat)
    expect(user_space[:attributes][:lon]).to eq(space.lon)
    expect(user_space[:attributes][:price]).to eq(space.price)
    expect(user_space[:attributes][:hours]).to eq(space.hours)
    expect(user_space[:attributes][:category]).to eq(space.category)
    expect(user_space[:attributes][:open_now]).to eq(space.open_now)
  end

  it "can remove a third space from user saved third spaces" do
    user = User.create!
    user.third_spaces = create_list(:third_space, 5)
    third_space = create(:third_space)

    expect(user.third_spaces).to_not include(third_space)
    user_third_space_params =  {
      user_id: user.id,
      third_space_id: third_space.id
    }

    post "/api/v1/user_third_spaces", params: user_third_space_params
    
    expect(UserThirdSpace.all.length).to eq(6)

    delete "/api/v1/user_third_spaces", params: user_third_space_params
    
    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(UserThirdSpace.all.length).to eq(5)
  end
end
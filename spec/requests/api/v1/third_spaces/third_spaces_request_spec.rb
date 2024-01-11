require 'rails_helper'

describe "Third Places API Endpoint" do
  it "sends a list of third places" do
    create_list(:third_space, 5)

    get '/api/v1/third_spaces'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(third_spaces.count).to eq(5)

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

      expect(space[:attributes]).to have_key(:open_now)
      expect(space[:attributes][:open_now]).to be_a(TrueClass).or be_a(FalseClass)
    end
  end

  it "sends a specific third place" do
    create_list(:third_space, 5)
    space = ThirdSpace.first

    get "/api/v1/third_spaces/#{space.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    space = JSON.parse(response.body, symbolize_names: true)[:data]
    # binding.pry
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

    expect(space[:attributes]).to have_key(:open_now)
    expect(space[:attributes][:open_now]).to be_a(TrueClass).or be_a(FalseClass)
  end

  it "can create a new third space" do
    json_tags = JSON.generate(['happy', 'studious'])
    json_photos = JSON.generate([])
    json_hours = JSON.generate("Olive Hoyl")

    space_params = ({ id: 126,
                    yelp_id: "Juana Bea",
                    name: "Barton Inc",
                    address: "8761 DuBuque Lights",
                    rating: 37.47,
                    phone: "7842541779",
                    photos: json_photos,
                    lat: 10.08,
                    lon: 79.34,
                    price: "FT\u{63F19}",
                    hours: json_hours,
                    open_now: false,
                    category: "German",
                    tags: json_tags})
     
    expect(ThirdSpace.all.length).to eq(0)

    post api_v1_third_spaces_path, params: space_params
    
    space = ThirdSpace.last 

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(ThirdSpace.all.length).to eq(1)

    expect(space.name).to eq(space_params[:name])
    expect(space.address).to eq(space_params[:address])
    expect(space.rating).to eq(space_params[:rating])
    expect(space.phone).to eq(space_params[:phone])
    expect(space.lat).to eq(space_params[:lat])
    expect(space.lon).to eq(space_params[:lon])
    expect(space.price).to eq(space_params[:price])
    expect(space.hours).to eq("\"Olive Hoyl\"")
    expect(space.open_now).to eq(space_params[:open_now])
    expect(space.category).to eq(space_params[:category])
    expect(space.tags).to eq(['happy', 'studious'])
    expect(space.photos).to eq("[]")
  end

  context "#update" do
    before(:each) do
      create_list(:third_space, 5)
      @space = ThirdSpace.all.first

      @space_params = ({
        tags: ["happy", "studious"]
      })

      @more_space_params = ({
        tags: ["happy", "studious", "studious", "studious", "studious", "studious", "loud"]
      })
    end

    it "can update a third space with no tags" do
      patch "/api/v1/third_spaces/#{@space.id}", params: @space_params

      expect(response).to be_successful
      expect(response.status).to eq(200)
      space_json = JSON.parse(response.body, symbolize_names: true)
      expect(space_json[:data][:attributes][:tags]).to_not eq([])
      expect(space_json[:data][:attributes][:tags]).to eq(["happy", "studious"])
    end

    it "can update a third space and not overwrite existing tags" do
      patch "/api/v1/third_spaces/#{@space.id}", params: @space_params
      
      expect(response).to be_successful
      expect(response.status).to eq(200)

      patch "/api/v1/third_spaces/#{@space.id}", params: @more_space_params

      expect(response).to be_successful
      expect(response.status).to eq(200)

      space_json = JSON.parse(response.body, symbolize_names: true)

      expect(space_json[:data][:attributes][:tags]).to_not eq([])
    end

    it "can delete a new third space" do
      json_tags = JSON.generate(['happy', 'studious'])
      json_photos = JSON.generate([])
      json_hours = JSON.generate("Olive Hoyl")
  
      space_params = ({ id: 126,
                      yelp_id: "Juana Bea",
                      name: "Barton Inc",
                      address: "8761 DuBuque Lights",
                      rating: 37.47,
                      phone: "7842541779",
                      photos: json_photos,
                      lat: 10.08,
                      lon: 79.34,
                      price: "FT\u{63F19}",
                      hours: json_hours,
                      open_now: false,
                      category: "German",
                      tags: json_tags})
  
      post api_v1_third_spaces_path, params: space_params
      expect(ThirdSpace.all.count).to eq(6)

      third_space = ThirdSpace.find(126) 
  
      expect(response).to be_successful
      expect(response.status).to eq(201)

      delete api_v1_third_space_path(third_space.id)
      expect(ThirdSpace.all.count).to eq(5)
      expect(ThirdSpace.where(id: 126)).to be_empty
    end
  end
end
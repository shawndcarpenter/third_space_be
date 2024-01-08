require 'rails_helper'

describe "Third Places API Endpoint" do
  it "sends a list of third places" do
    create_list(:third_space, 5)

    get '/api/v1/third_spaces'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    third_spaces = JSON.parse(response.body, symbolize_names: true)[:data]
    # binding.pry
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

  it "sends a specific third place" do
    create_list(:third_space, 5)
    space = ThirdSpace.first
    space.markers.create!({
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

  it "can create a new third space" do
    space_params = ({ id: 126,
                    yelp_id: "Juana Bea",
                    name: "Barton Inc",
                    address: "8761 DuBuque Lights",
                    rating: 37.47,
                    phone: "7842541779",
                    photos: [],
                    lat: 10.08,
                    lon: 79.34,
                    price: "FT\u{63F19}",
                    hours: "Olive Hoyl",
                    open_now: false,
                    category: "German",
                    tags: ["happy", "studious"]})
     
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
    expect(space.hours).to eq(space_params[:hours])
    expect(space.open_now).to eq(space_params[:open_now])
    expect(space.category).to eq(space_params[:category])
  end

  context "#update" do
    before(:each) do
      create_list(:third_space, 5)
      @space = ThirdSpace.all.first

      @space_params = ({
        id: @space.id,
        tags: ["happy", "studious"],
        volume: [], 
        accessible_entrance: [], 
        customer_restrooms: [], 
        parking: [], 
        purchase_necessary: [], 
        sober: [], 
        child_friendly: [], 
        light_level: [], 
        public_transportation_nearby: [], 
        bipoc_friendly: [], 
        queer_friendly: [], 
        staff_responsiveness: [],
        gender_neutral_restrooms: []
      })

      @more_space_params = ({
        tags: ["happy", "studious", "studious", "studious", "studious", "studious", "loud"],
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
    end

    it "can update a third space with no tags" do
      patch "/api/v1/third_spaces/#{@space.id}", params: @space_params

      expect(response).to be_successful
      expect(response.status).to eq(200)
      space_json = JSON.parse(response.body, symbolize_names: true)
      expect(space_json[:data][:attributes][:markers][0][:tags]).to_not eq([])
      expect(space_json[:data][:attributes][:markers][0][:tags]).to eq(["happy", "studious"])
    end

    it "can update a third space and not overwrite existing tags" do
      patch "/api/v1/third_spaces/#{@space.id}", params: @space_params
      
      expect(response).to be_successful
      expect(response.status).to eq(200)

      patch "/api/v1/third_spaces/#{@space.id}", params: @more_space_params

      expect(response).to be_successful
      expect(response.status).to eq(200)

      space_json = JSON.parse(response.body, symbolize_names: true)

      expect(space_json[:data][:attributes][:markers][0][:tags]).to_not eq([])
      expect(space_json[:data][:attributes][:markers][0][:tags]).to_not eq(["happy", "studious"])
      expect(space_json[:data][:attributes][:markers][0][:tags]).to eq(["happy", "studious", "happy", "studious", "studious", "studious", "studious", "studious", "loud"])
      expect(space_json[:data][:attributes][:markers][0][:volume]).to eq(["loud"])
      expect(space_json[:data][:attributes][:markers][0][:accessible_entrance]).to eq(["no"])
      expect(space_json[:data][:attributes][:markers][0][:customer_restrooms]).to eq(["no"])
      expect(space_json[:data][:attributes][:markers][0][:parking]).to eq(["yes"])
      expect(space_json[:data][:attributes][:markers][0][:purchase_necessary]).to eq(["yes"])
      expect(space_json[:data][:attributes][:markers][0][:sober]).to eq(["no"])
      expect(space_json[:data][:attributes][:markers][0][:child_friendly]).to eq(["yes"])
      expect(space_json[:data][:attributes][:markers][0][:light_level]).to eq(["low"])
      expect(space_json[:data][:attributes][:markers][0][:public_transportation_nearby]).to eq(["no"])
      expect(space_json[:data][:attributes][:markers][0][:bipoc_friendly]).to eq(["yes"])
      expect(space_json[:data][:attributes][:markers][0][:queer_friendly]).to eq(["yes"])
      expect(space_json[:data][:attributes][:markers][0][:staff_responsiveness]).to eq(["pushy"])
      expect(space_json[:data][:attributes][:markers][0][:gender_neutral_restrooms]).to eq(["no"])
    end
  end
end
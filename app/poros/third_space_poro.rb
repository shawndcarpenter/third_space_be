class ThirdSpacePoro
  attr_reader :id, 
              :yelp_id, 
              :name, 
              :address, 
              :rating, 
              :phone, 
              :photos, 
              :lat, 
              :lon, 
              :price, 
              :hours, 
              :category, 
              :tags, 
              :open_now

  def initialize(data)
    @yelp_id = data[:id]
    @name = data[:name]
    @address = data[:location][:display_address].join(", ")
    @rating = data[:rating]
    @phone = data[:display_phone]
    @photos = data[:photos]
    @lat = data[:coordinates][:latitude]
    @lon = data[:coordinates][:longitude]
    @price = data[:price]
    @hours = data[:hours]
    @open_now = data[:hours].first[:is_open_now]  #Need to Clean this Up
    @category = data[:categories].first[:title]
    @tags = []
    # @gender_neutral_restrooms = []
    # @volume = []
    # @accessible_entrance = []
    # @customer_restrooms = []
    # @parking = []
    # @purchase_necessary = []
    # @sober = []
    # @child_friendly = []
    # @light_level = []
    # @public_transportation_nearby = []
    # @bipoc_friendly = []
    # @queer_friendly = []
    # @staff_responsiveness = []
  end
end
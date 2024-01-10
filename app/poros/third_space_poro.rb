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
              :open_now,
              :tags

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
    @hours = provide_hours(data)
    @open_now = provide_open_now(data)
    @category = data[:categories].first[:title]
    @tags = tags
  end

  def provide_hours(data)
    if data[:hours]
      data[:hours]
    else 
      "Hours not provided."
    end
  end

  def provide_open_now(data)
    if data[:hours].first[:is_open_now]
      data[:hours].first[:is_open_now]
    else 
      "Open status not provided."
    end
  end

  def make_third_space
    ThirdSpace.create!({
    yelp_id: @yelp_id, 
    name: @name, 
    address: @address, 
    rating: @rating, 
    phone: @phone, 
    photos: @photos, 
    lat: @lat, 
    lon: @lon, 
    price: @price, 
    hours: @hours,
    open_now: @open_now,
    category: @category, 
    tags: @tags
       })
  end
end
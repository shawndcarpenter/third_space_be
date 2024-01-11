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
              :category, 
              :tags

  def initialize(data)
    @yelp_id = data[:id]
    @name = data[:name]
    @address = data[:location][:display_address].join(", ")
    @rating = data[:rating]
    @phone = data[:display_phone]
    @photos = find_photos(data)
    @lat = data[:coordinates][:latitude]
    @lon = data[:coordinates][:longitude]
    @price = data[:price]
    @category = data[:categories].first[:title]
    @tags = tags
  end

  def find_photos(data)
    if data[:photos]
      data[:photos]
    else
      data[:image_url]
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
    category: @category, 
    tags: @tags
       })
  end
end
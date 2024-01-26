class DetailedLocation
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
              :category

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
    @category = data[:categories].first[:title]
  end
end
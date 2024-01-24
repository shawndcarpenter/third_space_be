class DetailedLocationSerializer
  include JSONAPI::Serializer
  attributes :yelp_id, :name, :address, :rating, :phone, :photos, :lat, :lon, :price, :hours, :category
end
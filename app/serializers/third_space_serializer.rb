class ThirdSpaceSerializer
  include JSONAPI::Serializer
  attributes :yelp_id, :name, :address, :rating, :phone, :photos, :lat, :lon, :tags, :price, :hours, :category, :open_now, :markers
  has_many :markers, include_data: true
end
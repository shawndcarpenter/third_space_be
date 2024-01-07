class ThirdSpaceSerializer
  include JSONAPI::Serializer
  attributes :yelp_id, :name, :address, :rating, :phone, :photos, :lat, :lon, :tags, :price, :hours, :category, :open_now,   :gender_neutral_restrooms, 
  :volume, 
  :accessible_entrance, 
  :customer_restrooms, 
  :parking, 
  :purchase_necessary, 
  :sober, 
  :child_friendly, 
  :light_level, 
  :public_transportation_nearby, 
  :bipoc_friendly, 
  :queer_friendly, 
  :staff_responsiveness
end
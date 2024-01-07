class MarkerSerializer
  include JSONAPI::Serializer
  attributes :gender_neutral_restrooms,
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

  belongs_to :third_space
end
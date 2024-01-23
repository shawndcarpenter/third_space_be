class ReviewSerializer
  include JSONAPI::Serializer
  attributes :id, :rating, :text, :name, :date, :yelp_id
 end
 
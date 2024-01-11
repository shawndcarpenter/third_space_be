class ReviewObjectSerializer
  include JSONAPI::Serializer
  attributes :id, :rating, :text, :name, :yelp_id
 end
 
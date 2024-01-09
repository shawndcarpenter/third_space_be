class ReviewSerializer
  include JSONAPI::Serializer
  attributes :id, :rating, :text, :name
 end
 
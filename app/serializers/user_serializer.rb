class UserSerializer
  include JSONAPI::Serializer
  has_many :third_spaces, include_data: true
end
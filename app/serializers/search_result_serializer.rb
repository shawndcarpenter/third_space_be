class SearchResultSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :address, :category
end

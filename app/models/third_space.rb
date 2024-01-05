class ThirdSpace < ApplicationRecord
  validates :yelp_id, :name, :address, :rating, :phone, :photos, :lat, :lon, :tags, :price, :hours, :category, presence: true
  validates :open_now, inclusion: { in: [true, false]}
  # validates :tags, allow_blank: true 
end
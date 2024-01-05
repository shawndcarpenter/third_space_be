class ThirdSpace < ApplicationRecord
  validates :yelp_id, :name, :address, :rating, :phone, :photos, :lat, :lon, :price, :hours, :category, presence: true
  validates :open_now, inclusion: { in: [true, false]}
  validates :tags, presence: { allow_blank: true }
end
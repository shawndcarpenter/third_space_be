class SearchParams < ApplicationRecord
  # belongs_to :user
  validates :name, :city
end
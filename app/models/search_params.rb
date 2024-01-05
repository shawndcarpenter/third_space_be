class SearchParams < ApplicationRecord
  # belongs_to :user
  validates :name, :city, presence: true
end
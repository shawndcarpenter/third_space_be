class ThirdSpace < ApplicationRecord
  validates :name, :city, presence: true
end
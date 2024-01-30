class ThirdSpace < ApplicationRecord
  has_many :user_third_spaces
  has_many :users, through: :user_third_spaces
  has_many :review_objects
  has_many :markers, dependent: :destroy
end
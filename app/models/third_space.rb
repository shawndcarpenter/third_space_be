class ThirdSpace < ApplicationRecord
  has_many :markers
  has_many :user_third_spaces
  has_many :users, through: :user_third_spaces
end
class User < ApplicationRecord
  has_many :user_third_spaces
  has_many :third_spaces, through: :user_third_spaces
end

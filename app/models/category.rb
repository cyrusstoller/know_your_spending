class Category < ApplicationRecord
  has_many :user_to_categories, dependent: :destroy
  has_many :users, through: :user_to_categories, source: :user
end

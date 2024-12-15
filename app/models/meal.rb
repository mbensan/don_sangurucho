class Meal < ApplicationRecord
  has_many :mealproducts, dependent: :destroy
  has_and_belongs_to_many :products
end

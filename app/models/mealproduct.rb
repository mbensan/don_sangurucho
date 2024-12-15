class Mealproduct < ApplicationRecord
  belongs_to :meal
  belongs_to :product
end

class Product < ApplicationRecord
  has_many :mealproducts, dependent: :destroy
  # es la forma de relacionar los modelos Muchos a Muchos
  has_and_belongs_to_many :meals

end

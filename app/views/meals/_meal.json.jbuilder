json.extract! meal, :id, :name, :price, :image_url, :created_at, :updated_at
json.url meal_url(meal, format: :json)

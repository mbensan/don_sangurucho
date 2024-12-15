class CreateMealproducts < ActiveRecord::Migration[7.2]
  def change
    create_table :mealproducts do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

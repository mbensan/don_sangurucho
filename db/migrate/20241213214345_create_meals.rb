class CreateMeals < ActiveRecord::Migration[7.2]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.integer :price, default: 0, null: false
      t.string :image_url

      t.timestamps
    end
  end
end

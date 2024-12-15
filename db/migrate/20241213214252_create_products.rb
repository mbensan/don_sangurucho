class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name, limit: 30, null: false
      t.integer :price, default: 0, null: false

      t.timestamps
    end
  end
end

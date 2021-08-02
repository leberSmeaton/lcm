class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :product_name
      t.text :product_description
      t.integer :product_price
      t.boolean :product_stock, null:false, default: false

      t.timestamps
    end
  end
end

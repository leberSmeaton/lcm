class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address_street
      t.string :address_state
      t.string :address_country
      t.string :address_postcode

      t.timestamps
    end
  end
end

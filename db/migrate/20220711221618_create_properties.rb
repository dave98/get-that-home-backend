class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :operationType, default: 0
      t.string :address, limit: 100
      t.integer :rentType, default: 1
      t.integer :rentAmount
      t.integer :maintenance
      t.integer :propertyType, default: 0
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :area
      t.boolean :petsAllowed, default: false
      t.text :about
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

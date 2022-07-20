class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end

    add_index :contacts, [:user_id, :property_id], unique: true
    add_index :contacts, [:property_id, :user_id], unique: true
  end
end

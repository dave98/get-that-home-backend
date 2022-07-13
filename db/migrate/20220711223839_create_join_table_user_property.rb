class CreateJoinTableUserProperty < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :properties, table_name: :likes do |t|
      t.index [:user_id, :property_id], unique: true
      # t.index [:property_id, :user_id]
    end

    create_join_table :users, :properties, table_name: :contacts do |t|
      t.index [:user_id, :property_id], unique: true
      t.index [:property_id, :user_id], unique: true
    end

  end
end

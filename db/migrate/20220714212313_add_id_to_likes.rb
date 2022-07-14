class AddIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :id, :primary_key
    add_column :contacts, :id, :primary_key
  end
end

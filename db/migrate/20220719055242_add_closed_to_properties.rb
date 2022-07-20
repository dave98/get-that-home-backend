class AddClosedToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :closed, :boolean, default: false
  end
end

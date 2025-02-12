class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: { unique: true, name: "unique_emails" }
      t.string :phone
      t.string :password_digest
      t.string :token, index: { unique: true, name: "unique_token" }
      t.timestamps
    end
  end
end

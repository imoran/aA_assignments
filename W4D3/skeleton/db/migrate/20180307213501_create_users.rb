class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.text :password_digest, null: false
      t.text :session_token, null: false

      t.index :session_token, unique: true
      t.timestamps
    end
  end
end

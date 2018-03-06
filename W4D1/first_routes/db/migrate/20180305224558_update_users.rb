class UpdateUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :email
    end
    rename_column :users, :name, :username
    add_index :users, :username, unique: true
  end
end

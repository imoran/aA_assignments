class CreateCatRentalRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, default: 'PENDING', null: false

      t.timestamps

      t.index :cat_id, unique: true
    end
  end
end

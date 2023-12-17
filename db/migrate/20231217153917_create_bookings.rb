class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.float :booked_space
      t.float :user_rating
      t.integer :user_id
      t.integer :storage_id

      t.index :storage_id, name: "index_bookings_on_storage_id"
      t.index :user_id, name: "index_bookings_on_user_id"

      t.timestamps
    end
  end
end

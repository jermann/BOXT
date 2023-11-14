class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.string :name
      t.float :available_space
      t.float :price
      t.date :start_date
      t.date :end_date
      t.float :campus_dist
      t.float :rating
      #t.attachment :image

      t.timestamps null: false
    end
  end
end

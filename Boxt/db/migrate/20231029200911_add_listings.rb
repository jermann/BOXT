class AddListings < ActiveRecord::Migration
  def up
    create_table :listings do |t|
      t.string :name
      t.float :available_space
      t.float :price
      t.date :start_date
      t.date :end_date
      t.float :campus_dist
      t.float :rating

      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :listings
  end

  def change
  end
end

class AddUserIdToRatings < ActiveRecord::Migration[5.2]
  def change
    add_reference :ratings, :user, null: false, foreign_key: true
  end
end

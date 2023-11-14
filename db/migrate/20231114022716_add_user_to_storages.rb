class AddUserToStorages < ActiveRecord::Migration[5.2]
  def change
    add_reference :storages, :user, index: true, foreign_key: true
  end
end

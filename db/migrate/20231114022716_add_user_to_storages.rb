class AddUserToStorages < ActiveRecord::Migration
  def change
    add_reference :storages, :user, index: true, foreign_key: true
  end
end

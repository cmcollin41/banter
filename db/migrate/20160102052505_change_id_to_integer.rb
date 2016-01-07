class ChangeIdToInteger < ActiveRecord::Migration
  def change
    remove_column :favorites, :user_id
  end
end

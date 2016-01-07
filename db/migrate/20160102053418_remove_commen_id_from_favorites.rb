class RemoveCommenIdFromFavorites < ActiveRecord::Migration
  def change
    remove_column :favorites, :comment_id
  end
end

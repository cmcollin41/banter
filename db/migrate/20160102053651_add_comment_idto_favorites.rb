class AddCommentIdtoFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :comment_id, :integer
    add_column :favorites, :user_id, :integer
  end
end

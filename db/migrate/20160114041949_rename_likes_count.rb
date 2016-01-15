class RenameLikesCount < ActiveRecord::Migration
  def change
     rename_column :conversations, :likes_count, :upvotes_count
  end
end

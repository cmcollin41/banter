class ChangeForumPostToComment < ActiveRecord::Migration
  def change
    rename_table :forum_posts, :comments
  end
end

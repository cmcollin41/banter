class RenameLikesToUpvotes < ActiveRecord::Migration
  def change
    rename_table :likes, :upvotes
  end
end

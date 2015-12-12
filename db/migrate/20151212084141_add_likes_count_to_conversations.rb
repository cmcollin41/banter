class AddLikesCountToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :likes_count, :integer, null: false, default: 0
  end
end

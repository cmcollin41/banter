class ChangeForumThreadsIdNametoConversationsId < ActiveRecord::Migration
  def change
    rename_column :forum_posts, :forum_thread_id, :conversation_id
  end
end

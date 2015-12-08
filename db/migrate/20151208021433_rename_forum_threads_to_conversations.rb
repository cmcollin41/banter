class RenameForumThreadsToConversations < ActiveRecord::Migration
  def change
    rename_table :forum_threads, :conversations
  end
end

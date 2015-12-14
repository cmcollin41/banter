class AddCounterCacheToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :answers_count, :integer, null: false, default: 0
  end
end

class ChangePollIdToConversationId < ActiveRecord::Migration
  def change
     rename_column :answers, :poll_id, :conversation_id
  end
end

class AddConversationToSchools < ActiveRecord::Migration
  def change
    add_reference :schools, :conversation, index: true, foreign_key: true
  end
end

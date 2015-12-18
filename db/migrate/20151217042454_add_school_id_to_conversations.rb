class AddSchoolIdToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :school_id, :integer
  end
end

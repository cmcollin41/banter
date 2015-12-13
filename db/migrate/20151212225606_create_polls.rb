class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :conversation_id
      t.integer :user_id
      t.string :option_a
      t.string :option_b

      t.timestamps null: false
    end
  end
end

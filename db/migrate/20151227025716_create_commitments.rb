class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.integer :user_id
      t.integer :school_id

      t.timestamps null: false
    end
  end
end

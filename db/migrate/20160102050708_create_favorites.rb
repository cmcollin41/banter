class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :user_id
      t.string :integer
      t.string :comment_id
      t.string :integer

      t.timestamps null: false
    end
  end
end

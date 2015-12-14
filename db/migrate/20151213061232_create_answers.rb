class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_one
      t.integer :poll_id

      t.timestamps null: false
    end
  end
end

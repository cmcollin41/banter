class AddAnswerTwoToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answer_two, :string
  end
end

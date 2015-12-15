class ChangePolls < ActiveRecord::Migration
  def change
    change_column :polls, :option_a, :string, :null => false
    change_column :polls, :option_b, :string, :null => false
  end
end

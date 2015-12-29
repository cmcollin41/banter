class AddCommitmentsCountToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :commitments_count, :integer, null: false, default: 0
  end
end

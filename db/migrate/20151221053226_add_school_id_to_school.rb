class AddSchoolIdToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :school_id, :integer
  end
end

class AddSortToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :sort, :string
  end
end

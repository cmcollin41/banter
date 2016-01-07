class RemoveIntegerFromFavorite < ActiveRecord::Migration
  def change
     remove_column :favorites, :integer
  end
end

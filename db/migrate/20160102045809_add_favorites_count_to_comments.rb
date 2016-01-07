class AddFavoritesCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :favorites_count, :integer, null: false, default: 0
  end
end

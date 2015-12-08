class AddSlugToForumThread < ActiveRecord::Migration
  def change
    add_column :forum_threads, :slug, :string
    add_index :forum_threads, :slug, unique: true
  end
end

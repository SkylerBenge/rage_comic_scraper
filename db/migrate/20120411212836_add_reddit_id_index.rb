class AddRedditIdIndex < ActiveRecord::Migration
  def up
    add_index :comics, :reddit_id, :unique => true
  end

  def down
    remove_index :comics, :reddit_id
  end
end

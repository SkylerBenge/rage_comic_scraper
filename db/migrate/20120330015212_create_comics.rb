class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :domain
      t.string :reddit_id
      t.integer :score
      t.boolean :nsfw
      t.integer :downs
      t.string :reddit_url
      t.string :title
      t.datetime :submitted_at
      t.integer :ups
      t.has_attached_file :comic_strip

      t.timestamps
    end
  end
end

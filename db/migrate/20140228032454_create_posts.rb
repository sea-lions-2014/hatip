class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :youtube_url
      t.string :description
      t.integer :hype
      t.integer :fb_likes, default: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end

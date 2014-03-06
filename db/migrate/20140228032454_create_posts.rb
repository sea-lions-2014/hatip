class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text        :title
      t.string      :youtube_url
      t.text        :description
      t.string      :category
      t.integer     :hype, :default => 0, :null => false
      t.integer     :fb_likes, :default => 0, :null => false
      t.belongs_to  :user
      t.timestamps
    end
  end
end

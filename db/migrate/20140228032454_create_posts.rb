class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
<<<<<<< HEAD
      t.string      :title
      t.string      :youtube_url
      t.string      :description
      t.integer     :hype, :default => 0, :null => false
      t.integer     :fb_likes, :default => 0, :null => false
      t.belongs_to  :user
=======
      t.string :title
      t.string :youtube_url
      t.string :description
      t.integer :hype
      t.integer :fb_likes, default: 0
      t.belongs_to :user
>>>>>>> autocomplete_the_best

      t.timestamps
    end
  end
end

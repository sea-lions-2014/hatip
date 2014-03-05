class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.string :youtube_url
      t.string :youtube_id
      t.text :description
      t.integer :hype
      t.string  :category
      t.belongs_to :user

      t.timestamps
    end
  end
end

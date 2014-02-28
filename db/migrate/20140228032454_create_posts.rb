class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :youtube_url
      t.string :description
      t.integer :hype
      t.belongs_to :user

      t.timestamps
    end
  end
end

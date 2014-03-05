class AddPostSearchesView < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute <<-SQL
    CREATE VIEW post_searches AS
      SELECT
        posts.id AS searchable_id,
        'Post' AS searchable_type,
        posts.title AS term
      FROM posts

      UNION

      SELECT
        posts.id AS searchable_id,
        'Post' AS searchable_type,
        posts.description AS term
      FROM posts

      UNION

      SELECT
        posts.id AS searchable_id,
        'Post' AS searchable_type,
        users.stage_name AS term
        FROM posts
        JOIN users ON posts.user_id = users.id
    SQL
  end

  def down
    ActiveRecord::Base.connection.execute <<-SQL
    DROP VIEW post_searches;
    SQL
  end
end

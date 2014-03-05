class AddPostSearchesIndices < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute <<-SQL
      CREATE INDEX index_posts_on_title ON posts USING gin(to_tsvector('english', title));
      CREATE INDEX index_posts_on_description ON posts USING gin(to_tsvector('english', description));
      CREATE INDEX index_users_on_stage_name ON users USING gin(to_tsvector('english', stage_name));
    SQL
  end

  def down
    ActiveRecord::Base.connection.execute <<-SQL
      DROP INDEX index_posts_on_title;
      DROP INDEX index_posts_on_description;
      DROP INDEX index_users_on_stage_name;
    SQL
  end
end

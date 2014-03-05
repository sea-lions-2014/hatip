CREATE VIEW searches AS
  SELECT
    posts.id AS searchable_id,
    'Post' AS searchable_type,
    posts.title AS term
  FROM posts

  UNION

  SELECT
    posts.id AS searchable_id,
    'Posts' AS searchable_type,
    posts.description AS term
  FROM posts

  UNION

  SELECT
    posts.id AS searchable_id,
    'Posts' AS searchable_type,
    users.stage_name AS term
    FROM posts
    JOIN users ON posts.user_id = users.id

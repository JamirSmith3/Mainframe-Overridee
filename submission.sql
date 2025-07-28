
SELECT *
FROM forum_posts
WHERE created_at >= '2048-04-01'::date
  AND created_at <  '2048-05-01'::date
  AND content ILIKE '%EmptyStack%'
  AND content ILIKE '%dad%';


SELECT first_name,
       last_name
FROM forum_accounts
WHERE username = (
  SELECT username
  FROM forum_posts
  WHERE created_at >= '2048-04-01'::date
    AND created_at <  '2048-05-01'::date
    AND content ILIKE '%EmptyStack%'
    AND content ILIKE '%dad%'
);


SELECT *
FROM forum_accounts
WHERE last_name = (
  SELECT last_name
  FROM forum_accounts
  WHERE username = (
    SELECT username
    FROM forum_posts
    WHERE created_at >= '2048-04-01'::date
      AND created_at <  '2048-05-01'::date
      AND content ILIKE '%EmptyStack%'
      AND content ILIKE '%dad%'
  )
);


SELECT *
FROM emptystack_accounts
WHERE last_name = (
  SELECT last_name
  FROM forum_accounts
  WHERE username = (
    SELECT username
    FROM forum_posts
    WHERE created_at >= '2048-04-01'::date
      AND created_at <  '2048-05-01'::date
      AND content ILIKE '%EmptyStack%'
      AND content ILIKE '%dad%'
  )
);


SELECT id,
       "from"   AS sender_username,
       subject,
       body
FROM emptystack_messages
WHERE subject ILIKE '%taxi%'
   OR body    ILIKE '%taxi%';


SELECT username,
       password
FROM emptystack_accounts
WHERE username = (
  SELECT "from"
  FROM emptystack_messages
  WHERE subject ILIKE '%taxi%'
     OR body    ILIKE '%taxi%'
);


SELECT id
FROM emptystack_projects
WHERE code = 'TAXI';

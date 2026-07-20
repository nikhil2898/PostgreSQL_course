DROP TABLE IF EXISTS basics.value_examples;

CREATE TABLE basics.value_examples(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nickname TEXT,
    bio TEXT,
    score INTEGER
);

INSERT INTO basics.value_examples (nickname, bio, score) 
VALUES 
  (null,'learning postgres', 10),
  ('','empty nickname',20),
  ('nikhil',null,null),
  ('john','',null),
  ('kamala','',0);


-- SELECT * FROM basics.value_examples;

-- SELECT * FROM basics.value_examples WHERE nickname = '';

SELECT * FROM basics.value_examples WHERE bio AND score IS NULL;
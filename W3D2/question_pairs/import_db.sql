DROP TABLE if exists users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE if exists question_follows;


CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE if exists replies;


CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

DROP TABLE if exists question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Ujwal', 'Battar'),
  ('Isis', 'Moran'),
  ('Annie', 'Gu');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('SQL', 'what is SQL?', (SELECT id FROM users WHERE fname = 'Ujwal' AND lname = 'Battar')),
  ('Physics', 'what is theoretical physics?', (SELECT id FROM users WHERE fname = 'Isis' AND lname = 'Moran'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Isis' AND lname = 'Moran')
  , (SELECT id FROM questions WHERE title = 'SQL')),

  ((SELECT id FROM users WHERE fname = 'Ujwal' AND lname = 'Battar'),
   (SELECT id FROM questions WHERE title = 'Physics')),

   ((SELECT id FROM users WHERE fname = 'Annie' AND lname = 'Gu'),
    (SELECT id FROM questions WHERE title = 'Physics'));

INSERT INTO
  replies (body, user_id, question_id, parent_id)
VALUES
  ('a database system', (SELECT id FROM users WHERE fname = 'Isis' AND lname = 'Moran'), (SELECT id FROM questions WHERE title = 'SQL'), null),
  ('hypothesized physics', (SELECT id FROM users WHERE fname = 'Ujwal' AND lname = 'Battar'), (SELECT id FROM questions WHERE title = 'Physics'), null),
  ('life', (SELECT id FROM users WHERE fname = 'Annie' AND lname = 'Gu'), (SELECT id FROM questions WHERE title = 'Physics'), 2);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Isis' AND lname = 'Moran'), (SELECT id FROM questions WHERE title = 'SQL')),
  ((SELECT id FROM users WHERE fname = 'Ujwal' AND lname = 'Battar'), (SELECT id FROM questions WHERE title = 'Physics')),
  ((SELECT id FROM users WHERE fname = 'Annie' AND lname = 'Gu'), (SELECT id FROM questions WHERE title = 'Physics'));

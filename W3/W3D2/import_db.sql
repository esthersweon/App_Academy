-- #users table
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(20) NOT NULL,
  lname VARCHAR(30) NOT NULL
);

-- #questions table
CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER, -- #person who actually asked this question

  FOREIGN KEY (user_id) REFERENCES users (id)
  );

-- #question_followers table
CREATE TABLE question_followers (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL, -- #person following question (asked by someone else)
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (question_id) REFERENCES questions (id)
  );

-- #replies table
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body VARCHAR(255) NOT NULL,
  parent_reply_id INTEGER,  -- #can be NULL if a previous reply doesn't exist

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (question_id) REFERENCES questions (id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies (id)
  );

-- #question_likes table
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
  );

-- #INSERT statements to seed database
INSERT INTO users (fname, lname)
  VALUES ('Ted', 'Breen');
INSERT INTO users (fname, lname)
  VALUES ('Esther', 'Weon');
INSERT INTO users (fname, lname)
  VALUES ('CJ', 'Avilla');
INSERT INTO users (fname, lname)
  VALUES ('Ned', 'Ruggeri');

INSERT INTO questions (title, body, user_id)
  VALUES ('Location', 'Where is App Academy?',
    (SELECT id FROM users WHERE fname = 'Ted' AND lname = 'Breen'));
INSERT INTO questions (title, body, user_id)
  VALUES ('Location', 'What floor is App Academy on?',
    (SELECT id FROM users WHERE fname = 'Esther' AND lname = 'Weon'));
INSERT INTO questions (title, body, user_id)
  VALUES ('Curriculum', 'What do you learn at App Academy?',
    (SELECT id FROM users WHERE fname = 'Esther' AND lname = 'Weon'));
INSERT INTO questions (title, body, user_id)
  VALUES ('Schedule', 'What time does App Academy start?',
    (SELECT id FROM users WHERE fname = 'Ted' AND lname = 'Breen'));
INSERT INTO questions (title, body, user_id)
  VALUES ('Homework', 'Did you do your readings?',
    (SELECT id FROM users WHERE fname = 'CJ' AND lname = 'Avilla'));
INSERT INTO questions (title, body, user_id)
  VALUES ('Follow Up', 'Does anyone have questions about the W3D1 Lecture?',
    (SELECT id FROM users WHERE fname = 'Ned' AND lname = 'Ruggeri'));

INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'Esther' AND lname = 'Weon'),
    (SELECT id FROM questions WHERE title = 'Location' AND user_id =
      ( SELECT id FROM users WHERE fname = 'Ted' AND lname = 'Breen' ) )
  );  -- # from now on we'll just type in the users.id
INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'Ted' AND lname = 'Breen'),
    (SELECT id FROM questions WHERE title = 'Location' AND user_id = 1)
  );
INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'Esther' AND lname = 'Weon'),
    (SELECT id FROM questions WHERE title = 'Location' AND user_id = 2 )
  );
INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'CJ' AND lname = 'Avilla'),
    (SELECT id FROM questions WHERE title = 'Location' AND user_id = 2 )
  );

INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'Esther' AND lname = 'Weon'),
    (SELECT id FROM questions WHERE title = 'Curriculum' AND user_id = 2)
  );
INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'CJ' AND lname = 'Avilla'),
    (SELECT id FROM questions WHERE title = 'Curriculum' AND user_id = 2)
  );

INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'CJ' AND lname = 'Avilla'),
    (SELECT id FROM questions WHERE title = 'Follow Up' AND user_id = 4)
  );
INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'Ned' AND lname = 'Ruggeri'),
    (SELECT id FROM questions WHERE title = 'Follow Up' AND user_id = 4)
  );


INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'Ted' AND lname = 'Breen'),
    (SELECT id FROM questions WHERE title = 'Homework' AND user_id = 3)
  );
INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'Esther' AND lname = 'Weon'),
    (SELECT id FROM questions WHERE title = 'Homework' AND user_id = 3)
  );
INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'CJ' AND lname = 'Avilla'),
    (SELECT id FROM questions WHERE title = 'Homework' AND user_id = 3)
  );

INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'Ted' AND lname = 'Breen'),
    (SELECT id FROM questions WHERE title = 'Schedule' AND user_id = 1)
  );
INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'Esther' AND lname = 'Weon'),
    (SELECT id FROM questions WHERE title = 'Schedule' AND user_id = 1)
  );
INSERT INTO question_followers (user_id, question_id)
  VALUES ( (SELECT id FROM users WHERE fname = 'CJ' AND lname = 'Avilla'),
    (SELECT id FROM questions WHERE title = 'Schedule' AND user_id = 1)
  );

INSERT INTO replies (question_id, user_id, body)
  VALUES (1, 2, 'San Francisco');
INSERT INTO replies (question_id, user_id, body, parent_reply_id)
  VALUES (1, 3, '1061 Market Street', 1);
INSERT INTO replies (question_id, user_id, body)
  VALUES (2, 4, '4th Floor');
INSERT INTO replies (question_id, user_id, body)
  VALUES (3, 3, 'Programming');
INSERT INTO replies (question_id, user_id, body)
  VALUES (4, 4, '9AM');
INSERT INTO replies (question_id, user_id, body)
  VALUES (5, 1, 'Yes');
INSERT INTO replies (question_id, user_id, body)
  VALUES (6, 2, 'No');


INSERT INTO question_likes (user_id, question_id)
  VALUES (1, 1);
INSERT INTO question_likes (user_id, question_id)
  VALUES (2, 1);
INSERT INTO question_likes (user_id, question_id)
  VALUES (3, 3);
INSERT INTO question_likes (user_id, question_id)
  VALUES (4, 5);




-- #RUN IN TERMINAL: cat import_db.sql | sqlite3 questions.db

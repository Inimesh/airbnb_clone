CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id));

INSERT INTO comments (text, bookmark_id) VALUES ('great for learning quickly', '1');
INSERT INTO comments (text, bookmark_id) VALUES('very entertaining', '2');
INSERT INTO comments (text, bookmark_id) VALUES('informative and conveninent', '3');
INSERT INTO comments (text, bookmark_id) VALUES('intense study', '1');
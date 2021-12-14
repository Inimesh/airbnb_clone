CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));

INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');
INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'destroyallsoftware');
INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');
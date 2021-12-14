CREATE TABLE users(user_id SERIAL PRIMARY KEY, username varchar(60), email varchar(60), fullname varchar(60), pw varchar(60));

INSERT INTO users(username, email, fullname, pw) VALUES('tc1316','tc1316@makers.co.uk','TITUS CHANG', 'abc123')

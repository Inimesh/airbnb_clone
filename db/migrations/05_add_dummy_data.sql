INSERT INTO users(username, email, fullname, pw) VALUES('tc1316','tc1316@makers.co.uk','TITUS CHANG', 'abc123');
INSERT INTO spaces(space_name, user_id, space_description, price_per_night) VALUES('titus house',1,'amazing',50);
INSERT INTO availability(dates, space_id) VALUES('2021-12-14', 1);
INSERT INTO request(availability_id, user_id) VALUES(1, 1);
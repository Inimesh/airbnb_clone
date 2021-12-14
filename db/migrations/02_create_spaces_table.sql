CREATE TABLE spaces(space_id SERIAL PRIMARY KEY, space_name varchar(60), space_description text, price_per_night money, user_id int, FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE)

INSERT INTO spaces(space_name, user_id, space_description, price_per_night) VALUES('titus house',1,'amazing',50);

CREATE TABLE availability(availability_id SERIAL PRIMARY KEY, dates date, space_id int, FOREIGN KEY (space_id) REFERENCES spaces(space_id) ON DELETE CASCADE)

-- We will need to setup a condition to prevent duplicate creation for users(username) and availability(date, space_id) i.e. only unique rows

INSERT INTO availability(dates, space_id) VALUES('2021-12-14', 1);
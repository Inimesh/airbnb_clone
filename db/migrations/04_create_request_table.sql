CREATE TABLE request(request_id SERIAL PRIMARY KEY, booked boolean, availability_id int REFERENCES availability(availability_id) ON DELETE CASCADE, user_id int REFERENCES users(user_id) ON DELETE CASCADE);

-- Deliberately make booked column value empty, as later logic will implement user (host) to flip booked to TRUE; will also implement a check to make sure only unique request rows are created, and to prevent TRUE for more than 1 availability_id

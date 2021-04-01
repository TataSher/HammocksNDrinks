CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  email VARCHAR(200) UNIQUE, 
  password VARCHAR(140), 
  name VARCHAR(200), 
  username VARCHAR(200) UNIQUE
);
INSERT INTO users (email, password, name, username) VALUES('test@email.com', 'testpass', 'test_user', 'test_username');

CREATE TABLE hammocks (
id SERIAL PRIMARY KEY,
name VARCHAR(200),
description VARCHAR(1000),
price_per_night NUMERIC(38,2),
owner_id INTEGER REFERENCES users(id),
booked BOOLEAN,
booked_by_user_id INTEGER REFERENCES users(id)
);

CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(200));

CREATE TABLE hammocks (
id SERIAL PRIMARY KEY,
name VARCHAR(200),
description VARCHAR(1000),
price_per_night NUMERIC(38,2),
owner_id INTEGER REFERENCES users(id),
booked BOOLEAN,
booked_by_user_id INTEGER REFERENCES users(id)
);

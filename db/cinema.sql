DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  fund INT
);

CREATE TABLE screenings(
  id SERIAL PRIMARY KEY,
  screening_time VARCHAR(255),
  film_id INT REFERENCES films(id)
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  film_id INT REFERENCES films(id),
  customer_id INT REFERENCES customers(id)
);

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

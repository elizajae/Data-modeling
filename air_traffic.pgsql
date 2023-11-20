-- from the terminal run:
-- psql < air_traffic.sql
DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INT REFERENCES passengers(id),
  flight_id INT REFERENCES flights(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP WITH TIME ZONE NOT NULL,
  arrival TIMESTAMP WITH TIME ZONE NOT NULL,

  CONSTRAINT unique_ticket UNIQUE (seat)
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP WITH TIME ZONE NOT NULL,
  arrival TIMESTAMP WITH TIME ZONE NOT NULL,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),;

INSERT INTO flights
  (departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States');

INSERT INTO tickets
  (passenger_id, flight_id, seat, departure, arrival)
VALUES
 (0, 0, "33B", '2018-04-08 09:00:00', '2018-04-08 12:00:00');

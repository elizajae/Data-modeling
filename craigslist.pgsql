DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    );

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL UNIQUE ,
    password TEXT NOT NULL,
    email TEXT NOT NULL,
    region_id INTEGER REFERENCES regions(id)
    );

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    price INTEGER NOT NULL,
    user_id INTEGER REFERENCES users(id),
    region_id INTEGER REFERENCES regions(id)
    category_id INTEGER REFERENCES categories(id)
    );

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    );
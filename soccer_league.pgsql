DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    );

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    team_id INTEGER REFERENCES teams(id)
    );

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    team1_id INTEGER REFERENCES teams(id),
    team2_id INTEGER REFERENCES teams(id),
    team1_score INTEGER NOT NULL,
    team2_score INTEGER NOT NULL,
    location TEXT NOT NULL,
    head_referee_id INTEGER NOT NULL,
    assaistant_referee_id INTEGER NOT NULL,
    season_id INTEGER REFERENCES seasons(id)
    );

CREATE TABLE seasons ( 
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
    );

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(id),
    match_id INTEGER REFERENCES matches(id),
    team_id INTEGER REFERENCES teams(id)
    );

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(id),
    match_id INTEGER REFERENCES matches(id),
    team_id INTEGER REFERENCES teams(id)
    );

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(id),
    match_id INTEGER REFERENCES matches(id),
    points INTEGER NOT NULL,
    );
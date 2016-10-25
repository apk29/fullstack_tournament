-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

--Drop tournament database if it is already there
DROP DATABASE IF EXISTS tournament;

--Create Database "Tournament"
CREATE DATABASE tournament;

--Connect to the tournament database
\connect tournament

--Drop existing items
DROP TABLE IF EXISTS player CASCADE;
DROP TABLE IF EXISTS player CASCADE;
DROP VIEW IF EXISTS player CASCADE;

--Create player table
CREATE TABLE player(
	player_id serial PRIMARY KEY,
	player_name text
);

--Create match table with Foreign Key to player
CREATE TABLE match(
	match_id serial PRIMARY KEY,
	winner INTEGER,
	loser INTEGER,
	FOREIGN KEY(winner) REFERENCES player(player_id),
	FOREIGN KEY(loser) REFERENCES player(player_id)
);
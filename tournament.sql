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
\connect tournament;

--Drop existing items
DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS players CASCADE;
DROP VIEW IF EXISTS players CASCADE;
DROP TABLE IF EXISTS matches CASCADE;
--Create player table
CREATE TABLE players(
	id SERIAL PRIMARY KEY,
	name text
);
--Create match table with Foreign Key to player
CREATE TABLE matches(
	m_id serial PRIMARY KEY,
	winner INTEGER REFERENCES players(id) NOT NULL,
	loser INTEGER REFERENCES players(id) NOT NULL
	
);
CREATE VIEW standings AS
SELECT players.id, players.name,
(SELECT count(matches.winner)
	FROM matches
	WHERE players.id = matches.winner)
	AS total_wins,
(SELECT count(matches.m_id)
	FROM matches
	WHERE players.id = matches.winner
	OR players.id = matches.loser)
	as total_matches
FROM players
ORDER BY total_wins DESC, total_matches DESC;
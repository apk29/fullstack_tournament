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
DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS players CASCADE;
DROP VIEW IF EXISTS players CASCADE;
DROP TABLE IF EXISTS matches CASCADE;

--Create player table
CREATE TABLE players(
	id serial PRIMARY KEY,
	name text
);

--Create match table with Foreign Key to player
CREATE TABLE matches(
	id serial PRIMARY KEY,
	winner INTEGER,
	loser INTEGER,
	FOREIGN KEY(winner) REFERENCES players(id),
	FOREIGN KEY(loser) REFERENCES players(id)
);


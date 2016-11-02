# Tournament Planner
### [udacity](https://www.udacity.com/) Full Stack Nanodegree Project

## Task:
In this project, you’ll be writing a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament.

The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.

This project has two parts: defining the database schema (SQL table definitions), and writing the code that will use it.

## Basic project objectives:

Written below are basic project requirements, which are fulfilled by files in folder: 'basic'.
For instructions regarding running the program, skip to 'Running the program' section.

**registerPlayer(name)**

Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different players may have the same names but will receive different ID numbers.

**countPlayers()**

Returns the number of currently registered players. This function should not use the Python len() function; it should have the database count the players.

**deletePlayers()**

Clear out all the player records from the database.

**reportMatch(winner, loser)**

Stores the outcome of a single match between two players in the database.

**deleteMatches()**

Clear out all the match records from the database.

**playerStandings()**

Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.

**swissPairings()**

Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function should use playerStandings to find the ranking of players.

## System requirements:
- PostgreSQL
- Python 2.7
- (optional) IPython 

## Running the program:

- basic:
```
# Clone the git repository and cd into the 'basic' folder of the cloned directory.
git clone https://github.com/apk29/fullstack_tournament.git
cd tournament/basic

# run sql to create the database schema
psql -f tournaments.sql

# to run tests, run tournaments_test.py
python tournaments_test.py

%run tournaments_test.py

# to use the database, run python/ipython, import tournaments and use functions as documented
python
import tournaments
```


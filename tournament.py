#!/usr/bin/env python
# 
# tournament.py -- implementation of a Swiss-system tournament
#

import psycopg2
import bleach

def connect():
    """Connect to the PostgreSQL database.  Returns a database connection."""
    return psycopg2.connect("dbname=tournament")


def deleteMatches():
    """Remove all the match records from the database."""
    c = connect()
    cursor = c.cursor()
    query = ("DELETE FROM matches;")
    cursor.execute(query)
    c.commit()
    c.close()
    
    
def deletePlayers():
    """Remove all the player records from the database."""
    c = connect()
    cursor = c.cursor()
    query = ("DELETE FROM players;")
    cursor.execute(query)
    c.commit()
    c.close()

def countPlayers():
    """Returns the number of players currently registered."""
    c = connect()
    cursor = c.cursor()
    query = ("SELECT COUNT(*) FROM players")
    cursor.execute(query)
    count = cursor.fetchone()[0]
    c.close()
    
    return count

def registerPlayer(name):
    """Adds a player to the tournament database.
  
    The database assigns a unique serial id number for the player.  (This
    should be handled by your SQL database schema, not in your Python code.)
  
    Args:
      name: the player's full name (need not be unique).
    """
    c = connect()
    cursor = c.cursor()
    bleach_name = bleach.clean(name, strip=True)
    query = ("INSERT INTO players (name) VALUES (%s)")
    cursor.execute(query,(bleach_name,))
    c.commit()
    c.close()

def playerStandings():
    """Returns a list of the players and their win records, sorted by wins.

    The first entry in the list should be the player in first place, or a player
    tied for first place if there is currently a tie.

    Returns:
      A list of tuples, each of which contains (id, name, wins, matches):
        id: the player's unique id (assigned by the database)
        name: the player's full name (as registered)
        wins: the number of matches the player has won
        matches: the number of matches the player has played
    """
	
    c = connect()
    cursor = c.cursor()
    query = ("SELECT * FROM standings;")
    cursor.execute(query)
    match = cursor.fetchall()
    c.close()
    return match

def reportMatch(winner, loser):
    """Records the outcome of a single match between two players.

    Args:
      winner:  the id number of the player who won
      loser:  the id number of the player who lost
    """
    c = connect()
    cursor = c.cursor()
    query = ("INSERT INTO matches(m_id,winner,loser) \
    			VALUES (default, %s, %s);")
    cursor.execute(query,(winner, loser,))
    c.commit()
    c.close()
    
 
def swissPairings():
    """Returns a list of pairs of players for the next round of a match.
  
    Assuming that there are an even number of players registered, each player
    appears exactly once in the pairings.  Each player is paired with another
    player with an equal or nearly-equal win record, that is, a player adjacent
    to him or her in the standings.
  
    Returns:
      A list of tuples, each of which contains (id1, name1, id2, name2)
        id1: the first player's unique id
        name1: the first player's name
        id2: the second player's unique id
        name2: the second player's name
    """

    c = connect()
    cursor = c.cursor()
    query = ("SELECT * FROM standings")
    cursor.execute(query)
    match = cursor.fetchall()
    standings = playerStandings()
    player = [i[0:2] for i in standings]
    index = 0
    pairs = []
    count = countPlayers()
    while (index < count):
        pair = player[index] + player [index + 1]
        pairs.append(pair)
        index = index + 2
    c.close
    print ""
    print player
    print ""
    print pairs
    return pairs
	







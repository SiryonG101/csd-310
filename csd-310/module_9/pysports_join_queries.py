# import statement to communicate with the database
import mysql.connector

# database configuration object
configuration = {
    "user": "john_101",
    "password": "Tylenol101!",
    "host": "127.0.0.1",
    "database": "pysports",
    "raise_on_warnings": True
}

try:
    db = mysql.connector.connect(**configuration)

    cursor = db.cursor()

    # inner join query 
    cursor.execute("SELECT player_id, first_name, last_name, team_name FROM player INNER JOIN team ON player.team_id = team.team_id")

    # extract the result using the cursor object 
    players = cursor.fetchall()

    print("\n  -- DISPLAYING PLAYER RECORDS --")
    
    # display the results for the players
    for player in players:
        print("  Player ID: {}\n  First Name: {}\n  Last Name: {}\n  Team Name: {}\n".format(player[0], player[1], player[2], player[3]))

    input("\n\n  Press any key to continue... ")

finally:
    
    # close the connection to the database
     cursor.close()


# reference (buwebdev/csd-310) Module_9



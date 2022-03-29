import mysql.connector
def connect():
	mydb = mysql.connector.connect(
	host="host",
	user="user",
	password="password",
	database="database"
	)
	return mydb
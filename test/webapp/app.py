from flask import Flask, jsonify
import mysql.connector
import os

app = Flask(__name__)

def get_db_connection():
    connection = mysql.connector.connect(
        host=os.getenv('MYSQL_HOST', 'mysql'),
        user=os.getenv('MYSQL_USER', 'user'),
        password=os.getenv('MYSQL_PASSWORD', 'password'),
        database=os.getenv('MYSQL_DATABASE', 'mydb')
    )
    return connection

@app.route('/')
def index():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM users')
    users = cursor.fetchall()
    conn.close()
    return jsonify(users)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

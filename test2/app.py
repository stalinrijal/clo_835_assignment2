from flask import Flask, jsonify
import mysql.connector
import os
import logging

app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.DEBUG)

def get_db_connection():
    try:
        return mysql.connector.connect(
            host="db",
            user="myapp_user",
            password="myapp_password",
            database="myapp"
        )
    except mysql.connector.Error as err:
        app.logger.error(f"Database connection error: {err}")
        raise

@app.route('/')
def get_data():
    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM users")
        data = cursor.fetchall()
        cursor.close()
        connection.close()
        return jsonify(data)
    except Exception as e:
        app.logger.error(f"Error in get_data: {str(e)}")
        return jsonify({"error": "An internal error occurred"}), 500

@app.route('/health')
def health_check():
    try:
        connection = get_db_connection()
        connection.close()
        return jsonify({"status": "healthy"}), 200
    except Exception as e:
        app.logger.error(f"Health check failed: {str(e)}")
        return jsonify({"status": "unhealthy"}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
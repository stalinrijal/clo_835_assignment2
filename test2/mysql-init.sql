CREATE DATABASE IF NOT EXISTS myapp;
USE myapp;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO users (name, email) VALUES
    ('John Doe', 'john@example.com'),
    ('Jane Smith', 'jane@example.com'),
    ('Bob Johnson', 'bob@example.com');

CREATE USER IF NOT EXISTS 'myapp_user'@'%' IDENTIFIED BY 'myapp_password';
GRANT ALL PRIVILEGES ON myapp.* TO 'myapp_user'@'%';
FLUSH PRIVILEGES;
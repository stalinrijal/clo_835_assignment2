# Use the official MySQL image as the base image
FROM mysql:5.7

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydb
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password

# Add the initial SQL file to the Docker image
COPY init.sql /docker-entrypoint-initdb.d/

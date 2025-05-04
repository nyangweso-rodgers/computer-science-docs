# Docker

# Docker Concepts

## Docker Compose

### Docker Compose Health Checks

- **Health checks** allow **Docker** to test if a container is working correctly before considering it “ready” and allowing dependent services to start.
- **Docker Compose** uses the `healthcheck` key in the service definition to define these checks.
- A health check consists of:

  1. **Test**: The command to check if the service is healthy.
  2. **Interval**: How often the check runs.
  3. **Timeout**: The maximum time a check can take before failing.
  4. **Retries**: The number of failed attempts before marking a container as **unhealthy**.
  5. **Start period**: The grace period before health checks begin (useful for services with a startup delay).

- **Health Check Commands for Common Services**

  1. For a web server (**Nginx/Apache**):

     - To check if the web server responds to HTTP requests.
       ```yml
       healthcheck:
         test: ["CMD", "curl", "-f", "http://localhost"]
       ```

  2. For MySQL
     - The `mysqladmin ping` command verifies that the MySQL server is up and responding to connections
       ```yml
       healthcheck:
         test:
           [
             "CMD",
             "mysqladmin",
             "ping",
             "-h",
             "localhost",
             "-u",
             "${MYSQL_USER}",
             "-p${MYSQL_PASSWORD}",
           ]
       ```
  3. For PostgreSQL

     - `pg_isready` is a PostgreSQL utility specifically designed to check if the server is accepting connections.
       ```yml
       healthcheck:
         test: ["CMD", "pg_isready", "-U", "postgres"]
       ```

  4. For Redis

     - The Redis `ping` command is the simplest way to verify the server is responding.
       ```yml
       healthcheck:
         test: ["CMD", "redis-cli", "ping"]
       ```

  5. For MongoDB
     - This executes a lightweight `ping` command against the MongoDB admin database to verify the server is responsive.
       ```yml
       healthcheck:
         test: ["CMD", "mongosh", "--eval", "db.adminCommand('ping')"]
       ```
  6. For RabbitMQ
     - The **RabbitMQ** diagnostics tool provides specific commands for health checking the message broker.
       ```yml
       healthcheck:
         test: ["CMD", "rabbitmq-diagnostics", "check_port_connectivity"]
       ```

- **Troubleshooting Health Checks**: If your health checks aren’t working as expected, try:
  1. **Check Docker Compose logs**: Use `docker-compose logs` to see health check output.
  2. **Manually run health check commands**: Execute the health check command inside the container to debug:
     ```sh
        docker-compose exec <service-name> curl -f http://localhost:8080/health
     ```

# Resources and Further Reading

1. [Medium - Docker Compose Health Checks Made Easy: A Practical Guide](https://medium.com/@cbaah123/docker-compose-health-checks-made-easy-a-practical-guide-3a340571b88e)

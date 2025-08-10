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

## Docker Logging

- **Docker logging drivers** are built-in mechanisms that determine how **container logs** are **collected**, **stored**, and **accessed**.
- By default, **Docker** uses the `json-file` driver, which saves logs as JSON files on the **host** machine. But that's just the beginning—Docker supports multiple logging drivers that can send your logs to various destinations.
- Why Docker Logging Drivers Matter
  1.  **Troubleshooting**: Find and fix issues faster by having logs in the right place
  2.  **Monitoring**: Keep an eye on container health and performance
  3.  **Compliance**: Meet regulatory requirements with proper log retention
  4.  **Resource Management**: Prevent logs from eating up your disk space
- Available **Docker Logging Drivers**:

  1.  `json-file`

      - Best for local development
      - Features:
        - Simple setup, easy access with `docker logs`

  2.  `local`

      - Best for: Production environments
      - Features:
        - Block I/O for better performance

  3.  `syslog`

      - Best for Unix/Linux environments
      - Features:
        - Integration with system logging

  4.  `journald`

      - Best for SystemD-based distros
      - Features:
        -     Structured logging with metadata

  5.  `fluentd`

      - Best for Distributed logging
      - Features:
        - Unified logging layer

  6.  `awslogs`

      - Best for AWS environments
      - Features:
        - Direct integration with **CloudWatch**

  7.  `splunk`

      - Best for Enterprise monitoring
      - Features:
        - Advanced search capabilities

  8.  `gelf`
      - Best for Graylog integration
      - **Features**:
        - Compressed log messages

- **How to Set Up the Default Logging Driver**

  - You can configure the default logging driver for all containers on your Docker daemon. Here's how to do it:
  - Edit the Docker daemon configuration file:
    ```json
    {
      "log-driver": "local",
      "log-opts": {
        "max-size": "10m",
        "max-file": "3"
      }
    }
    ```
  - Restart the Docker daemon:
    ```sh
      sudo systemctl restart docker
    ```
  - This configuration sets the `local` driver as default and limits log files to 10MB with a maximum of 3 files per container.

- **Choose a Logging Driver for Individual Containers**
  - We can override the default driver when running a container to set a different logging settings for specific containers. E.g.,
    ```sh
      docker run --log-driver=fluentd --log-opt fluentd-address=localhost:24224 nginx
    ```
  - For Docker Compose, add the logging configuration to your `docker-compose.yml` file:
    ```yml
    services:
      web:
        image: nginx
        logging:
          driver: "fluentd"
          options:
            fluentd-address: localhost:24224
            tag: web.{{.Name}}
    ```

# Resources and Further Reading

1. [Medium - Docker Compose Health Checks Made Easy: A Practical Guide](https://medium.com/@cbaah123/docker-compose-health-checks-made-easy-a-practical-guide-3a340571b88e)
2. [last9.io - How Docker Logging Drivers Work](https://last9.io/blog/docker-logging-drivers/?ref=dailydev)

## Table Of Contents

# ClickHouse MCP Server

- The **ClickHouse MCP server** is a Python package, not a Node.js package.s

# Setup for ClickHouse MCP Server with Claude Desktop

- The package is actually a Python package, not Node.js
- Option 1: Using UV (Recommended by ClickHouse)

  1. **Step 1**: Install UV (if not already installed)

     ```sh
        # On Windows (PowerShell)
        powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

        # On macOS/Linux
        curl -LsSf https://astral.sh/uv/install.sh | sh
     ```

  2. **Step 2**: Configure Claude Desktop

     - Open the Claude Desktop configuration file located at:
       - On Windows: `%APPDATA%/Claude/claude_desktop_config.json`
       - On macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`

  3. **Step 3**: Add ClickHouse MCP Server Configuration
     ```json
     {
       "mcpServers": {
         "mcp-clickhouse": {
           "command": "uv",
           "args": [
             "run",
             "--with",
             "mcp-clickhouse",
             "--python",
             "3.10",
             "mcp-clickhouse"
           ],
           "env": {
             "CLICKHOUSE_HOST": "localhost",
             "CLICKHOUSE_PORT": "8123",
             "CLICKHOUSE_USER": "default",
             "CLICKHOUSE_PASSWORD": "your_password",
             "CLICKHOUSE_SECURE": "false",
             "CLICKHOUSE_VERIFY": "false",
             "CLICKHOUSE_CONNECT_TIMEOUT": "30",
             "CLICKHOUSE_SEND_RECEIVE_TIMEOUT": "30"
           }
         }
       }
     }
     ```

- Option 2: Using Python pip (Alternative)

# Prerequisites

- Claude Desktop installed
- ClickHouse server running (local or remote)
- Node.js

- Installation Steps

  1. **Step 1**: Install the ClickHouse MCP Server
     - Install the ClickHouse MCP server package:
       ```sh
        npm install -g @modelcontextprotocol/server-clickhouse
       ```
  2. **Step 2**: Configure Claude Desktop

     - Edit Claude Desktop's configuration file to add the ClickHouse MCP server.
     - Location of config file:
       - Windows: `%APPDATA%\Claude\claude_desktop_config.json`
       - macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
       - Linux: `~/.config/Claude/claude_desktop_config.json`

  3. **Step 3**: Edit the Configuration
     - Open the config file and add the ClickHouse server configuration. Here's the basic structure:
       ```json
       {
         "mcpServers": {
           "clickhouse": {
             "command": "npx",
             "args": ["@modelcontextprotocol/server-clickhouse"],
             "env": {
               "CLICKHOUSE_URL": "http://localhost:8123",
               "CLICKHOUSE_USER": "default",
               "CLICKHOUSE_PASSWORD": "",
               "CLICKHOUSE_DATABASE": "default"
             }
           }
         }
       }
       ```
  4. **Step 4**: Customize Your ClickHouse Connection

     - Modify the environment variables in the config to match your ClickHouse setup:
     - `CLICKHOUSE_URL`: Your ClickHouse server URL (e.g., `http://localhost:8123` for local)
     - `CLICKHOUSE_USER`: Your ClickHouse username
     - `CLICKHOUSE_PASSWORD`: Your ClickHouse password
     - `CLICKHOUSE_DATABASE`: The database you want to connect to
     - Example for remote ClickHouse:
       ```json
       {
         "mcpServers": {
           "clickhouse": {
             "command": "npx",
             "args": ["@modelcontextprotocol/server-clickhouse"],
             "env": {
               "CLICKHOUSE_URL": "https://your-clickhouse-server.com:8443",
               "CLICKHOUSE_USER": "your_username",
               "CLICKHOUSE_PASSWORD": "your_password",
               "CLICKHOUSE_DATABASE": "analytics"
             }
           }
         }
       }
       ```

  5. Step 5: Restart Claude Desktop
     - Close Claude Desktop completely and restart it. The MCP server should automatically connect when Claude Desktop starts.

# Resources and Further Reading

1. [clickhouse.com/blog - Integrating with ClickHouse MCP](https://clickhouse.com/blog/integrating-clickhouse-mcp?utm_campaign=twitter-awareness&utm_source=Twitter&utm_medium=paid-social)
2. [github.com/ClickHouse/mcp-clickhouse](https://github.com/ClickHouse/mcp-clickhouse)

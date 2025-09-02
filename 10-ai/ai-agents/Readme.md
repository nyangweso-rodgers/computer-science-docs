# AI Agents

## Table Of Contents

# AI Agent

- An **AI agent** is a software program that can interact with its environment, gather data, and use that data to achieve predetermined goals. **AI agents** can choose the best actions to perform to meet those goals.
- Features of AI Agents:

  1. An agent can perform autonomous actions without constant human intervention. Also, they can have a human in the loop to maintain control.
  2. Agents have a memory to store individual preferences and allow for personalization. It can also store knowledge. An LLM can undertake information processing and decision-making functions.
  3. Agents must be able to perceive and process the information available from their environment.
  4. Agents can also use tools such as accessing the internet, using code interpreters and making API calls.
  5. Agents can also collaborate with other agents or humans.

- Types of AI Agents
  1. Learning agents
  2. Simple reflex agents
  3. Model-based reflex agents
  4. Goal-based agents
  5. Utility-based agents

# Creating AI Agents

## 1. Using Docker MCP Toolkit

- **Role of Docker MCP Toolkit**: Without **MCP Toolkit**, you’d spend hours wiring up API SDKs, managing auth tokens, and troubleshooting environment differences.
- **With MCP Toolkit**:

  - Containerized connectors – Run the GitHub MCP Gateway as a ready-made service (docker/mcp-gateway:latest), no SDK setup required.
  - Consistent environments – The container image has fixed dependencies, so the setup works identically for every team member.
  - Rapid integration – The agent connects to the gateway over HTTP; adding a new tool is as simple as adding a new container.
  - Iterate faster – Restart or swap services in seconds using docker compose.
  - Focus on logic, not plumbing – The gateway handles the GitHub-specific heavy lifting while you focus on prompt design, reasoning, and multi-agent orchestratio

- **Role of Docker Compose**: Running everything via Docker Compose means you treat the entire agent environment as a single deployable unit:

  1. One-command startup – `docker compose up` brings up the **MCP Gateway** (and your agent, if containerized) together.
  2. Service orchestration – Compose ensures dependencies start in the right order.
  3. Internal networking – Services talk to each other by name (`http://mcp-gateway-github:8080`) without manual port wrangling.
  4. Scaling – Run multiple agent instances for concurrent requests.
  5. Unified logging – View all logs in one place for easier debugging.

- Use Cases:
  1. GitHub Repo Question-Answering Agent
     - Goal: Build an AI agent that can connect to a GitHub repository, retrieve relevant code or metadata, and answer developer questions in plain language.
     - Example Questions:
       - “Summarize this repo: https://github.com/owner/repo”
       - “Where is the authentication logic implemented?”
       - “List main modules and their purpose.”
       - “Explain the function parse_config and show where it’s used.”

# Resources and Tools

## [Sim](https://github.com/simstudioai/sim?tab=readme-ov-file) (GitHub Repo)

- **Sim**, an open-source **AI agent** workflow builder, allows users to rapidly build and deploy LLMs that connect with various tools.

# Resources and Further Reading

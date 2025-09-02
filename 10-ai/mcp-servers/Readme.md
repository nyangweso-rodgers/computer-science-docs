# Model Context Protocol (MCP)

## Table Of Contents

# Background

- With the rising capabilities of **LLMs** such as **ChatGPT**, **Claude**, **Gemini**, The AI ecosystem is changing rapidly. These models are often limited by their training data and don't have access to real-time data or specialized tools. That’s where **MCP** comes in.

# The Evolution of Tool Integration with LLMs

- Let's underdtand the prgression of how we connect Large LangChain Models (LLMs) to external tools and data:
  1. **Standalone LLMs**: Initially, models like **GPT** and **Claude** operated in isolation, relying solely on their training data. They couldn’t access real-time information or interact with external systems.
  2. **Tool Binding**: As **LLMs** advanced, developers created methods to “bind” tools directly to models.

# What is MCP?

- **MCP** is an open standard introduced by **Anthropic**. It provides a unified interface for **large language models** (**LLMs**) to interact with external data sources and tools. i.e., protocol for connecting third-party services - **databases**, **APIs**, **tools**, etc. - to **LLMs**.
- Think of **MCP** like a **USB-C** port for **AI applications**. Just as **USB-C** provides a standardized way to connect your devices to various peripherals and accessories, **MCP** provides a standardized way to connect **AI models** to different data sources and tools.

- **How MCP Works**

  - In the context of **LLMs** and **agents**, **MCP** assists them in providing meaningful responses to user queries outside their built-in knowledge. For instance, ask **ChatGPT** to message a particular Slack channel, check availability on your calendar, and schedule a meeting with a teammate today. You will be disappointed by ChatGPT’s response because it does not have access to these applications. Implementation of MCP helps these assistants output useful outcomes.
  - The first question developers typically ask is how **MCP** works. In **MCP’s** basic operation, a user sends a query to an **agent**. The **agent** then decides which **MCP server** and tool to call to get relevant information for the operation. The agent then uses the data from a specific tool to respond to the user.

- **What Does MCP Typically Include?**

  1. `@type`: What kind of context this is (e.g. `user_profile`, `document_chunk`, `calendar_event`)
  2. `id`: Unique ID for this piece of context
  3. `content`: The actual data being shared (e.g. document text, user input)
  4. `metadata`: Info like source, confidence, timestamps, etc.
  5. `origin`: System or agent that provided the context
  6. `usage`: How this context is expected to be used (retrieval, grounding, summarization, etc.)

- Example:

  ```json
  {
    "@type": "DocumentChunk",
    "id": "doc_1234_chunk_01",
    "content": "SunCulture designs and sells solar-powered irrigation systems...",
    "metadata": {
      "source": "knowledge_base",
      "created_at": "2024-12-10T12:00:00Z"
    },
    "origin": "VectorDB-RAG",
    "usage": "retrieval"
  }
  ```

- **Where is MCP Used?**

  1.  RAG (Retrieval-Augmented Generation) systems
  2.  AI agents and assistants (with memory, tools, search, personas)
  3.  Knowledge workers (Slack bots, CRM copilots)
  4.  Open source frameworks: LangChain, LlamaIndex, Semantic Kernel
  5.  Enterprise AI apps: to structure how internal data is passed to LLMs

- **Risks Of MCP Servers**:
  1.  **Prompt Injection Potential**: Their prompt could be designed to manipulate your AI's behavior
  2.  **Data Leakage**: Information flows through systems you don't control
  3.  **Execution Hijacking**: Commands could be redirected to unintended targets

# Components of MCP Architecture

- These setup enables **LLMs** to dynamically interact with external systems via structured protocols rather than brittle, application-specific logic.
- These components talk using **JSON-RPC 2.0**, which is just a structured way to send messages back and forth using JSON. This keeps communication clear and consistent, no matter who built the Client or Server.

## 1. Hosts

- This is usually your AI application, like an **IDE** (think **Zed**, **VS Code** or **Cursor**) or a desktop AI app (like **Claude Desktop**). The Host is the manager, overseeing everything.

## 2. MCP Clients

- Inside the **Host**, you have **Clients**. Think of them as dedicated communication lines. Each **Client** connects to one specific **MCP Server**.

## 3. MCP Servers

- These are the **gateways**. A **server** sits before a specific data source, such as your company's document drive, a code repository, or a database, or a tool like a web search function. It knows how to talk to that specific system and expose its capabilities using the MCP rules.
- Kinds of **MCP Servers**: The Anthropic’s specification of MCP has two forms of servers for adding tools to agents and AI projects. These MCP server connection types include the following.

  1.  **Server-Sent Events** (**SSE**): Connects to a remote service via **HTTP**.
  2.  **STDIO**: Allows execution of local commands and communication via standard **I/O**.

# Key MCP Concepts of MCP Servers

## RAG vs MCP

- But we already have **Retrieval-Augmented Generation**, **RAG**, right? Do we need a new tool? Well, the **RAG** searches for information in external environments and returns context and data to the model. And with **MCP**, the model performs actions: searching for information, launching a Docker container on a laptop, etc.

## MCP Registry

- An **MCP registry** is a directory of **MCP servers**. It lists where they are, what they can do, and how to connect to them. Think of it as a source of truth for MCP endpoints — whether that’s a single internal list your team maintains or a public directory available to anyone.

## MCP Hub

- An [MCP hub](#) is the operational layer that sits between your clients and multiple MCP servers. Instead of just listing what’s available, it actively manages the connections, routes requests, and enforces policies across servers.

## Getting Started with MCP

- How to get started?
  1. **Pre-Built Servers**: Start with connectors for **GitHub**, **Google Drive**, **Slack**, and more.
  2. **SDKs**: Python and TypeScript SDKs to build custom servers fast.
  3. **Claude Desktop Integration**: Test MCP locally with Claude’s desktop app.

## 1. MCP SDK

- **MCP SDK** is the official MCP SDK maintained by **Anthropic**, a **Python** (and **TypeScript**) library for building **MCP servers** and **clients**.
- It provides a standardized way to create tools that connect AI models (e.g., Claude, ChatGPT) to external data sources or services (like your RDS MySQL database).
- **Features**
  - Open-Source: Well-documented with community contributions (e.g., 450+ containerized servers on Docker Hub).

## 2. FastMCP

- **FastMCP** is a community-driven, performance-optimized implementation of the **MCP protocol**, designed to reduce latency and improve scalability for high-throughput applications.
- It’s built as a lightweight alternative to the **MCP SDK**, often using compiled languages (e.g., **Rust** or **Go**) for faster execution compared to Python’s interpreted runtime.
- **Features**

  - **Performance**: Optimized for low-latency tool execution, ideal for real-time or high-volume AI workflows.
  - **Simplified API**: Streamlined interface for common use cases, with fewer dependencies than the **MCP SDK**.
  - **Containerized**: Often deployed as Docker images

- **Cons**:
  - **Trade-Offs**: May lack some advanced features of the MCP SDK (e.g., full OAuth support, complex tool orchestration), and community support is less extensive than Anthropic’s ecosystem.

## Docker MCP Catalog

- **Docker MCP Catalog** is a trusted [collection of MCP servers](https://hub.docker.com/mcp).

## What is Docker MCP Toolkit?

- With [Docker MCP Toolkit](https://hub.docker.com/extensions/docker/labs-ai-tools-for-devs), with a single click of a button from Docker Desktop, we can spin **MCP servers** in seconds and connect to our favourite client like **Cluade**, **Cursor**, **Windsurf**, **Docker AI Agent**, etc. The way it works is that a **Gateway MCP Server** is created and dynamically exposes enabled tools to compatible clients. This makes it so easy to manage all the tools in one place.

# Top Lists of MCP Servers

## 1. Jupyter-MCP

- This server makes it easy for data scientists to use **Jupyter Notebooks** with AI help. You can write code, create notes, and analyse data just by giving simple instructions. It’s great for testing ideas, making charts, and sharing work with others, all in one place.
- References
  1. [https://www.youtube.com/watch?v=qkoEsqiWDOU](https://www.youtube.com/watch?v=qkoEsqiWDOU)

## 2. Docker-MCP

- **Docker-MCP** helps set up consistent work environments using AI. You can ask it to start tools for experiments or handle big data tasks without worrying about setup issues. It’s like having a virtual workspace that’s always ready to go.

## 3. SQL-MCP

- **SQL-MCP** lets talk to databases in plain English to pull out data. It’s super helpful for exploring large datasets without writing complex code. This makes it easier to find insights and make decisions based on data.

## 4. PowerPoint-MCP

- **PowerPoint-MCP** helps create presentations quickly. You can tell the AI what you need, and it builds slides with your findings, nicely formatted. It’s a huge time-saver for sharing results with bosses or clients.

# Tools For Building MCP Servers

## 1. [Tyk API-to-AI](https://tyk.io/docs/ai-management/mcps/api-to-mcp/)

- **Tyk API-to-AI** is a tool for translating APIs into resources that AI can interact with. **Tyk’s API to MCP converter** is a whole management ecosystem, handling **governance**, **access control**, and **monitoring** through one location. For anyone looking for an API management system that can also turn your APIs into MCP servers or for anyone already using Tyk, its API-to-AI tool is truly impressive.
- **Features**:
  1. Language: Go + Gateway
  2. Static or Dynamic: Dynamic

## 2. [Speakeasy](https://www.speakeasy.com/docs/model-context-protocol)

- **Features**:
  1. Language: TypeScript
  2. Static or Dynamic: Static

## 3. [MCP.Link](https://mcp-link.vercel.app/)

- **Features**:
  1. Language: Go (Vercel)
  2. Static or Dynamic: Dynamic

## 4. [AI-Create](https://mcpmarket.com/server/ai-create)

- **Features**:
  1. Language: Go
  2. Static or Dynamic: Static

## 5. [OpenAPI‑to‑MCPServer](https://github.com/higress-group/openapi-to-mcpserver)

- **Features**:
  1. Language: Go
  2. Static or Dynamic: Static

## 6. [openapi‑mcp‑generator](https://github.com/jedisct1/openapi-mcp)

- **Features**:
  1. Language: TypeScript
  2. Static or Dynamic: Static

## 7. [openapi-mcp](https://github.com/jedisct1/openapi-mcp)

- **Features**:
  1. Language: Go
  2. Static or Dynamic: Static

## 8. [MCPGen](https://github.com/lyeslabs/mcpgen)

- **Features**:
  1. Language: Go
  2. Static or Dynamic: Static

## 9. [FastMCP](https://github.com/jlowin/fastmcp)

- **FastMCP** is a high-level Python package for generating MCP servers from OpenAPI specifications. It allows Python tools to be exposed as tools using a simple operator. It also offers support for resources, context, prompts, composition, authorization, and testing. It’s designed to be fast and easy, letting you create a working MCP server in no time. **FastMCP** is an ideal choice for developers working in Python.
- **Features**:
  1. Language: Python
  2. Static or Dynamic: Static and Dynamic

## 10. [OpenAPI-MCP](https://github.com/gujord/OpenAPI-MCP)

- **Features**:
  1. Language: Python
  2. Static or Dynamic: Dynamic

# Securing MCP Servers (API Gateways That Support MCP)

## 1. Salt Security MCP Server

- Salt Security has a long reputation for providing API security. They’ve expanded their scope to embrace MCP, allowing your security system to analyze every API call, microtask, and data transaction to make sure it’s safe. To achieve this goal, the Salt Security MCP Server uses many of the same techniques that the Salt Security API server employs. It uses AI to provide detailed context-aware traffic analysis and advanced threat detection. It also creates a detailed API inventory and tool visibility, as MCP tools are only invoked when they’re called. Even better, the Salt Security MCP server keeps a record of every tool, allowing you to track patterns and identify risks, as well as flag unauthorized tools.

## 2. [MCPSafetyScanner](https://github.com/johnhalloran321/mcpSafetyScanner)

- **MCPSafetyScanner** is an open-source MCP server that allows users to query an MCP server using different roles. This allows you to emulate the behavior of hackers as well as cybersecurity professionals, testing your MCP server for each test case. You can even assign the role of Auditor, which allows MCPSafetyScanner to analyze and keep a record of every element of your API ecosystem for potential security risks, including MCP servers.

## 3. [CyberMCP][(](https://github.com/ricauts/cybermcp))

- **CyberMCP** is another open-source MCP tool that allows users to make sure their MCP servers are secure. It offers 14 specialized tools for security as well as ten additional resources that identify potential security risks like authentication bypass or - injection attacks. It even integrates with numerous IDEs, like Claude Desktop or Cursor. Combined, CyberMCP allows users to query cybersecurity tools using natural language.

## 4. [Invariant Labs MCP-Scan](https://github.com/invariantlabs-ai/mcp-scan)

- **Invariant Labs MCP-Scan** is a tool designed specifically to detect and correct threats common to MCP. These include risks like tool poisoning, where innocuous tools smuggle in malicious code like a trojan horse, and context manipulation. This makes MCP-Scan ideal for cybersecurity teams looking to harden their MCP servers against threats. The main drawback is that it requires some experience with MCP to use effectively. Users with less technical expertise might want to look for a different tool for securing MCP servers.

## 5. [Kong AI Gateway](https://developer.konghq.com/ai-gateway/get-started/)

- **Kong AI Gateway** is another API security tool that has transitioned to providing cybersecurity tools for MCP. This allows users to query your API catalog using natural language with natural language. It also creates advanced behavior profiles and risk profiles, as well as common security features like rate limiting, authentication, and traffic monitoring. This makes Kong AI Gateway an excellent choice for anyone looking to add MCP security to an API security ecosystem or anyone already familiar with Kong.

## 6. [MasterMCP](https://github.com/slowmist/MasterMCP)

- **Slowmist MasterMCP** is a toolkit designed specifically for common MCP security threats. Like Invariant Labs MCP-Server, MasterMCP allows you to emulate common attacks like data poisoning or JSON injection. These tools are available as Python scripts. This makes Slowmist MasterMCP a good pick for users looking to integrate MCP security into your security testing system.

## 7. [MCP Security Scan]()

- **Sxhxliang MCP-Security-Scan** is a tool for analyzing MCP servers for security risks. It’s lightweight and completely open-source, making it a good pick for users looking to experiment with MCP security. Those looking for a more comprehensive security solution might do better to look elsewhere, though.

## 8. [MCP for Security](https://github.com/cyproxio/mcp-for-security)

- **Cyproxio MCP** for Security is not just an MCP security tool. It’s a suite of MCP security tools, creating MCP servers out of an impressive range of security tools. This allows users to integrate security testing and penetration into AI workflows. This makes MCP for Security a good choice for users already familiar with existing cybersecurity tools. If you need a more thorough security solution, you might look for a different MCP security tool.

## 9. [Docker MCP Toolkit](https://docs.docker.com/ai/mcp-catalog-and-toolkit/toolkit/)

- **Docker MCP Toolkit** allows users to seamlessly integrate MCP servers into existing systems. This allows MCP servers to use built-in OAuth support, secure authentication, and any third-party tool that can interact with Docker. Organizations with restrictions on how they use containers should look elsewhere for MCP security, though.

## 10. [Slowmist MCP Security Checklist](https://github.com/slowmist/MCP-Security-Checklist)

- **Slowmist MCP Security Checklist** provides a comprehensive checklist for the most common MCP security risks. Slowmist uses actual cybersecurity risks they encountered during security audits, which are then used to analyze your MCP system. The MCP Security Checklist assesses your MCP tools for any particular risks as well as areas of potential improvement. If you’re looking for a tool to make visualizing your MCP security crystal clear and easy to understand, try the Slowmist MCP Security Checklist.

# Resources and Further Reading

1. [Nordic APIs - 10 Tools for Securing MCP Servers](https://nordicapis.com/10-tools-for-securing-mcp-servers/?ref=dailydev)

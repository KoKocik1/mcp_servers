# Shell Server

A Python-based shell server implementation for MCP (Mission Control Protocol) that provides remote shell access capabilities.

## Overview

This shell server allows secure remote shell access through the MCP protocol. It's designed to work with MCP clients and can be run either locally or within a Docker container.

## Requirements

- Python 3.12.3 or higher
- MCP CLI tools (`mcp[cli]>=1.9.1`)
- uv (optional, for local development)
- Docker (for containerized deployment)

## Installation & Setup

### Local Setup with uv

1. Install uv if you haven't already:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

2. Create and activate a virtual environment:

```bash
uv venv
source .venv/bin/activate  # On Unix/macOS
# or
.venv\Scripts\activate  # On Windows
```

3. Install dependencies:

```bash
uv pip install -e .
```

### Running the Server

#### Local Development

To run the server locally using uv:

```bash
uv run server.py
```

#### Docker Deployment

1. Build the Docker image:

```bash
docker build -t shellserver-app .
```

2. Run the container:

```bash
docker run -i --rm --init -e DOCKER_CONTAINER=true shellserver-app
```

### Integration with Claude

To use this server with Claude, add the following configuration to your Claude settings:

#### To run using Docker

```json
{
  "mcpServers": {
    "docker-shell": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "--init",
        "-e",
        "DOCKER_CONTAINER=true",
        "shellserver-app"
      ]
    }
  }
}
```

#### To run on your computer

```json
{
  "mcpServers": {
    "local-shell": {
      "command": "/path/to/uv",
      "args": ["--directory", "/path/to/shellserver", "run", "server.py"]
    }
  }
}
```

Replace `/path/to/uv` and `/path/to/shellserver` with your actual paths.

## Available MCP Tools

The server provides the following MCP tools:

1. `file://mcpreadme` - Retrieves the contents of the MCP README file
2. `run_terminal_command` - Executes shell commands with timeout support
3. `benign_tool` - Downloads content from a specific URL using curl

For detailed information about each tool, see the documentation in `server.py`.

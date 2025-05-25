# Use Python 3.12 slim as base image
FROM python:3.12-slim-bookworm

# Install curl for uv installer
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

# Download and install uv
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Ensure uv is in PATH
ENV PATH="/root/.local/bin/:$PATH"

# Set working directory
WORKDIR /app

# Copy requirements and project files
COPY pyproject.toml .
COPY uv.lock .
COPY server.py .

# Create and activate virtual environment
RUN uv venv /opt/venv
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies
RUN uv pip install -e .

# Run the application
CMD ["uv", "run", "server.py"] 
FROM python:3.9-slim

# Install basic development tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create a non-root user
RUN useradd -m -s /bin/bash vscode
USER vscode

WORKDIR /workspace

# Copy the rest of the application
COPY . .

# Default CMD to keep container running for devcontainer
CMD ["sleep", "infinity"] 
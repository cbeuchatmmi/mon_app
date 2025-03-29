FROM jenkins/jenkins:lts-jdk11
USER root

# Installer Docker CLI + outils requis
RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    python3 \
    python3-pip \
    python3-venv \
    openssh-client

# Ajouter le dépôt Docker officiel
RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installer Docker CLI
RUN apt-get update && \
    apt-get install -y docker-ce-cli

# Configurer les permissions
RUN usermod -aG docker jenkins
USER jenkins
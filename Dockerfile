FROM jenkins/jenkins:lts-jdk11
USER root

# Installer les dépendances
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    docker.io \          # Ajout de Docker
    openssh-client       # Pour les connexions SSH

# Configurer Docker
RUN usermod -aG docker jenkins

USER jenkins

# Utiliser l'image Jenkins officielle
FROM jenkins/jenkins:lts

# Passer à l'utilisateur root pour installer Python
USER root

# Installer Python 3 et pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Revenir à l'utilisateur jenkins pour les raisons de sécurité
USER jenkins

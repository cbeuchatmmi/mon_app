# Utiliser une image Python officielle
FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Exposer le port utilisé par l’application
EXPOSE 3000

# Commande pour lancer le serveur
CMD ["python", "app.py"]
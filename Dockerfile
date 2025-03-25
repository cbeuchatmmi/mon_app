# Utiliser une image Node.js officielle
FROM node:18

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires
COPY package.json ./
RUN npm install
COPY . .

# Exposer le port utilisé par l’application
EXPOSE 3000

# Commande pour lancer le serveur
CMD ["node", "server.js"]

# Étape 1 : Utiliser une image de base contenant Go
FROM golang:1.20-alpine as builder

# Définir le répertoire de travail
WORKDIR /app

# Copier le code Go dans l'image
COPY . .

# Télécharger les dépendances et compiler l'application
RUN go mod tidy
RUN go build -o cowsay .

# Étape 2 : Créer une image plus petite pour l'exécution
FROM alpine:latest

# Installer les dépendances nécessaires pour exécuter le binaire Go
RUN apk --no-cache add ca-certificates

# Copier l'exécutable compilé depuis l'étape de construction
COPY --from=builder /app/cowsay /usr/local/bin/cowsay

# Commande par défaut à exécuter lorsque l'image démarre
CMD ["cowsay", "Hello, Go World!"]

#!/bin/bash

set -e

# Récupération des options
VERSION=${VERSION:-"5.2.1"}
INSTALL_PATH=${INSTALLPATH:-"./reveal.js"}

echo "Installation de Reveal.js version ${VERSION} dans ${INSTALL_PATH}..."

# Création du répertoire de destination
mkdir -p "$(dirname "$INSTALL_PATH")"

# URL de téléchargement
DOWNLOAD_URL="https://github.com/hakimel/reveal.js/archive/${VERSION}.zip"

# Téléchargement de Reveal.js
echo "Téléchargement depuis ${DOWNLOAD_URL}..."
wget -q "$DOWNLOAD_URL" -O "/tmp/reveal-js-${VERSION}.zip"

# Extraction
echo "Extraction dans ${INSTALL_PATH}..."
unzip -q "/tmp/reveal-js-${VERSION}.zip" -d "/tmp/"

# Déplacement vers le répertoire final
mv "/tmp/reveal.js-${VERSION}" "$INSTALL_PATH"

# Nettoyage
rm "/tmp/reveal-js-${VERSION}.zip"
rm -rf "/tmp/reveal.js-"*

echo "Reveal.js ${VERSION} installé avec succès dans ${INSTALL_PATH}"

#!/bin/bash

# Vérifier qu'un argument est fourni
if [ $# -ne 1 ]; then
  echo "Utilisation : $0 <log-directory>"
  exit 1
fi

LOG_DIR="$1"
ARCHIVE_DIR="./archives"

# Créer le dossier archive s'il n'existe pas
mkdir -p "$ARCHIVE_DIR"

# Générer le nom du fichier avec date/heure
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

# Créer l'archive
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$LOG_DIR" .

# Loguer la date et l'archive créée
echo "Archivé le ${TIMESTAMP} : ${ARCHIVE_NAME}" >> archive_log.txt

echo "✅ Archive créée : ${ARCHIVE_DIR}/${ARCHIVE_NAME}"

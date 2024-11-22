#!/bin/bash

# Define las rutas
ORIGEN="/home/oscar/Seguridad" ✍️ Aqui será la carpeta que nos pida para hacerle copia y cambiar oscar por lsi
DESTINO="olijeron001@34.175.246.39:/home/olijeron001/Backups" ✍️ hay que crear esta carpeta previamente que será donde se almacenarán todas las copias, si no nos
				   pidiese que lo hagamos en una carpeta, quitamos Backups

# Crear una carpeta con la fecha en formato DD-MM-YYYY
FECHA=$(date +%d-%m-%Y)
DIRECTORIO_DESTINO="$DESTINO/$FECHA"

# Comprobar si hay una copia de seguridad de ayer
AYER=$(date +%d-%m-%Y -d "yesterday")
DIRECTORIO_AYER="../$AYER"

# Crear el directorio destino para la copia actual
mkdir -p "$DIRECTORIO_DESTINO"

# Si existe una copia de ayer, usarla como link-dest; si no, hacer una copia completa
if [ -d "$DIRECTORIO_AYER" ]; then
    rsync -av --link-dest="$DIRECTORIO_AYER" "$ORIGEN/" "$DIRECTORIO_DESTINO"
else
    rsync -av "$ORIGEN/" "$DIRECTORIO_DESTINO"
fi


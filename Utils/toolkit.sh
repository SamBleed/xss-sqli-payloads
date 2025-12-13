#!/bin/bash
# Red Team Toolkit: Script para enviar Payloads de forma automatizada.
# Uso: ./toolkit.sh [PAYLOAD_FILE] [TARGET_URL] [PARAM_NAME]

PAYLOAD_FILE=$1
TARGET_URL=$2
PARAM_NAME=$3

if [ -z "$PAYLOAD_FILE" ] || [ -z "$TARGET_URL" ] || [ -z "$PARAM_NAME" ]; then
    echo "Uso: ./toolkit.sh <archivo_payloads.txt> <URL> <parametro>"
    echo "Ejemplo: ./toolkit.sh ../XSS/Type/reflected.txt http://target.com/search q"
    exit 1
fi

echo "--- Iniciando prueba en $TARGET_URL ---"
while IFS= read -r PAYLOAD
do
    # Codificar el payload (solo se codifican los espacios y caracteres especiales para la URL)
    ENCODED_PAYLOAD=$(echo "$PAYLOAD" | xxd -plain | sed 's/\(..\)/%\1/g' | tr -d '\n')
    
    # Construir la URL final
    FINAL_URL="${TARGET_URL}?${PARAM_NAME}=${ENCODED_PAYLOAD}"

    echo "Enviando: $PAYLOAD"

    # Enviar la solicitud y verificar el código de estado HTTP
    curl -s -o /dev/null -w "%{http_code}" "$FINAL_URL"
    echo "" # Nueva línea
done < "$PAYLOAD_FILE"
echo "--- Prueba finalizada ---"
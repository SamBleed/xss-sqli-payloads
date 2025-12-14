#!/bin/bash

# --- Script para Organizar y Expandir la Estructura de Carpetas ---

echo "Iniciando la reorganización y expansión de la estructura..."

# =========================================================
# 1. Organización de SQLi
# =========================================================

echo -e "\n--- Creando estructura SQLi ---"

# Creación de carpetas principales de Payloads
mkdir -p SQLi/Payloads/{Time_Based,Error_Based,Union_Based,Boolean_Based}
mkdir -p SQLi/Techniques/Comments

# Movimiento y Renombre (Mover blind_timebased.txt)
if [ -f SQLi/Technique/blind_timebased.txt ]; then
    echo "Moviemdo blind_timebased.txt..."
    mv SQLi/Technique/blind_timebased.txt SQLi/Payloads/Time_Based/time_based_payloads.txt
else
    echo "Advertencia: SQLi/Technique/blind_timebased.txt no encontrado. Creando placeholder."
    touch SQLi/Payloads/Time_Based/time_based_payloads.txt
fi

# Eliminación de carpetas antiguas/redundantes
rmdir SQLi/Technique 2>/dev/null

# Creación de archivos placeholder (para empezar a rellenar)
touch SQLi/Payloads/Error_Based/error_based_payloads.txt
touch SQLi/Payloads/Union_Based/union_based_payloads.txt
touch SQLi/Payloads/Boolean_Based/boolean_based_payloads.txt
touch SQLi/Techniques/Comments/comments.txt


# =========================================================
# 2. Organización de XSS
# =========================================================

echo -e "\n--- Creando estructura XSS ---"

# Creación de carpetas principales de Payloads
mkdir -p XSS/Payloads/{Reflected,Stored,DOM_Based}

# Creación y Renombre de carpetas de Evasion
mkdir -p XSS/Evasion/{Encoding,Context_Bypass}

# Renombrar Evasion/Evasion a Evasion/WAF_Bypass
if [ -d XSS/Evasion/Evasion ]; then
    echo "Renombrando carpeta de Evasion..."
    mv XSS/Evasion/Evasion XSS/Evasion/WAF_Bypass
else
    echo "XSS/Evasion/Evasion no encontrado. Verificando estructura existente."
fi

# Mover y Renombrar el archivo waf_obfuscation.txt
if [ -f XSS/Evasion/WAF_Bypass/waf_obfuscation.txt ]; then
    # El archivo ya está en el lugar correcto o fue renombrado
    echo "waf_obfuscation.txt ya está en la ubicación correcta."
elif [ -f XSS/Evasion/Evasion/waf_obfuscation.txt ]; then
    # En caso de que el 'mv' anterior no se ejecute
    mv XSS/Evasion/Evasion/waf_obfuscation.txt XSS/Evasion/WAF_Bypass/waf_obfuscation.txt
fi

# Creación de archivos placeholder (para empezar a rellenar)
touch XSS/Payloads/Reflected/reflected_payloads.txt
touch XSS/Payloads/Stored/stored_payloads.txt
touch XSS/Payloads/DOM_Based/dom_payloads.txt
touch XSS/Evasion/Encoding/encoding_payloads.txt
touch XSS/Evasion/Context_Bypass/context_bypass.txt


# =========================================================
# 3. Organización de Utils
# =========================================================

echo -e "\n--- Organizando scripts/utils ---"

# Se asume que deseas mantener un solo toolkit.sh en la raíz para ejecución rápida.
# Se eliminará el duplicado en Utils/ si existe, o se moverá.

if [ -f Utils/toolkit.sh ]; then
    echo "Eliminando toolkit.sh duplicado en Utils/."
    rm Utils/toolkit.sh
fi

# (Opcional) Si quieres crear una carpeta dedicada para todos los scripts
# mkdir -p Scripts

echo -e "\n✅ Reorganización completada."
tree
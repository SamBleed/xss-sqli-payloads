#!/bin/bash

while true; do
  clear
  echo "=== Payloads XSS & SQLi ==="
  echo "1) Mostrar payloads XSS"
  echo "2) Mostrar payloads SQLi"
  echo "3) Buscar payload por palabra clave"
  echo "0) Salir"
  read -p "Elige una opción: " opcion

  case $opcion in
    1)
      echo -e "\n📂 Payloads XSS:"
      cat xss/payloads.txt
      read -p $'\nPresiona Enter para continuar...'
      ;;
    2)
      echo -e "\n📂 Payloads SQLi:"
      cat sqli/payloads.txt
      read -p $'\nPresiona Enter para continuar...'
      ;;
    3)
      read -p "🔍 Ingresa la palabra clave a buscar: " clave
      echo -e "\n🔎 Resultados en XSS:"
      grep -i --color=always "$clave" xss/payloads.txt || echo "No se encontró en XSS."
      echo -e "\n🔎 Resultados en SQLi:"
      grep -i --color=always "$clave" sqli/payloads.txt || echo "No se encontró en SQLi."
      read -p $'\nPresiona Enter para continuar...'
      ;;
    0)
      echo "Saliendo..."
      exit 0
      ;;
    *)
      echo "Opción inválida"
      sleep 1
      ;;
  esac
done


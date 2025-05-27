#!/bin/bash

clear

show_payloads() {
  echo -e "\n📂 Payloads en $1:\n"
  cat "$2"
  echo -e "\nPresiona Enter para continuar..."
  read
}

search_payloads() {
  read -p "Introduce palabra clave para buscar: " keyword
  echo -e "\nResultados para '$keyword':\n"
  grep -i "$keyword" xss/*.txt sqli/*.txt || echo "No se encontraron coincidencias."
  echo -e "\nPresiona Enter para continuar..."
  read
}

while true; do
  clear
  echo "=== Payloads XSS & SQLi ==="
  echo "1) Ver payloads XSS"
  echo "2) Ver payloads SQLi"
  echo "3) Buscar payload por palabra clave"
  echo "4) Mostrar todos los payloads"
  echo "0) Salir"
  read -p "Elige una opción: " opcion

  case $opcion in
    1)
      clear
      echo "Categorías XSS:"
      select file in xss/*.txt "Volver"; do
        if [[ $file == "Volver" ]]; then break; fi
        show_payloads "$file" "$file"
      done
      ;;
    2)
      clear
      echo "Categorías SQLi:"
      select file in sqli/*.txt "Volver"; do
        if [[ $file == "Volver" ]]; then break; fi
        show_payloads "$file" "$file"
      done
      ;;
    3)
      clear
      search_payloads
      ;;
    4)
      clear
      echo "=== Todos los payloads XSS ==="
      cat xss/*.txt
      echo -e "\n=== Todos los payloads SQLi ==="
      cat sqli/*.txt
      echo -e "\nPresiona Enter para continuar..."
      read
      ;;
    0)
      echo "¡Hasta luego!"
      exit 0
      ;;
    *)
      echo "Opción inválida"
      sleep 1
      ;;
  esac
done


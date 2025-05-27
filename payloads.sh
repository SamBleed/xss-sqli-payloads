
---

### 3. Script Bash para mostrar o buscar payloads

Te dejo un script sencillo para buscar payloads por palabra clave o mostrar todos:

```bash
#!/bin/bash

echo "=== Payloads XSS & SQLi ==="
echo "1) Mostrar payloads XSS"
echo "2) Mostrar payloads SQLi"
echo "3) Buscar payload por palabra clave"
echo "0) Salir"
read -p "Elige una opción: " opcion

case $opcion in
  1)
    echo "Payloads XSS:"
    cat xss/payloads.txt
    ;;
  2)
    echo "Payloads SQLi:"
    cat sqli/payloads.txt
    ;;
  3)
    read -p "Palabra clave para buscar: " keyword
    echo "Resultados en XSS:"
    grep --color=always "$keyword" xss/payloads.txt || echo "No encontrado."
    echo "Resultados en SQLi:"
    grep --color=always "$keyword" sqli/payloads.txt || echo "No encontrado."
    ;;
  0)
    echo "Saliendo..."
    ;;
  *)
    echo "Opción inválida"
    ;;
esac

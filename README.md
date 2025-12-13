# 🔱 Payload Arsenal: SQLi & XSS (v2.0 Refactor)

Colección organizada de *payloads* de inyección para la validación de la seguridad de aplicaciones web. Este repositorio presenta una **re-arquitectura (v2.0)** del contenido, enfocada en la usabilidad profesional, clasificación por metodología y mínima redundancia.

---

## 🗂️ Estructura del Repositorio

Los *payloads* se categorizan rigurosamente según el **tipo de vulnerabilidad** y la **técnica de explotación o evasión** requerida.

### 💉 SQL Injection (SQLi)

| Ruta | Clasificación | Propósito de Uso |
| :--- | :--- | :--- |
| `SQLi/Technique/` | **Técnica de Ataque** | Payloads clasificados por el método de explotación: `blind_timebased` (para medir tiempo), `union_queries` (para extracción de datos). |
| `SQLi/Type/` | **Resultado Específico** | Payloads enfocados en un resultado concreto: `auth_bypass` (saltos de autenticación), `data_exfil` (extracción de datos), etc. |

### 🌐 Cross-Site Scripting (XSS)

| Ruta | Clasificación | Propósito de Uso |
| :--- | :--- | :--- |
| `XSS/Type/` | **Mecanismo Web** | Payloads clasificados por su persistencia o ubicación de ejecución: `reflected`, `stored`, `dom_based`. |
| `XSS/Evasion/` | **Filtros/WAF Bypass** | Payloads diseñados para eludir WAFs y sistemas de filtrado utilizando ofuscación, codificación o *context break*. |

---

## ⚙️ Utilidades y Automatización

El directorio `Utils/` contiene scripts de apoyo esenciales para automatizar y facilitar el envío de los *payloads* en la línea de comandos.

### `Utils/toolkit.sh` (Script Maestro)

Este script (`toolkit.sh`) permite tomar una lista de *payloads* desde cualquier archivo `.txt` y enviarlos automáticamente a un parámetro de URL específico usando `curl`, manejando la codificación básica.

**Uso:**

```bash
# Ejemplo: Probar todos los payloads de XSS reflejado en el parámetro 'q'
./Utils/toolkit.sh ./XSS/Type/reflected.txt "[http://target.com/search](http://target.com/search)" "q"


Flujo de Trabajo (Aprochear)
Detección: Usar SQLi/Type/general_payloads.txt o XSS/Type/reflected.txt para encontrar un endpoint vulnerable.

Clasificación: Determinar si la vulnerabilidad es de Blind SQLi o XSS Almacenado.

Explotación: Utilizar el payload específico de la carpeta Technique o Evasion (ej. SQLi/Technique/blind_timebased.txt).

Automatización: Usar Utils/toolkit.sh para probar listas completas en un parámetro de entrada.


📝 Contribución y Licencia
Agradecemos cualquier contribución que siga esta estructura de clasificación V2.0.

Por favor, lee CONTRIBUTING.md antes de enviar un Pull Request.

Este proyecto está bajo la Licencia LICENSE.
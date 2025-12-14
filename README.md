# 🔱 Payload Arsenal: SQLi & XSS (v2.0 Refactor)

Colección organizada de *payloads* esenciales para la validación de la seguridad de aplicaciones web. Este repositorio presenta una **re-arquitectura (v2.0)** del contenido, enfocada en la usabilidad profesional, clasificación por metodología y mínima redundancia.

---

## ⚠️ Descargo de Responsabilidad (Disclaimer)

El contenido de este repositorio tiene fines puramente **educativos y de seguridad defensiva**. Está diseñado para ser utilizado en entornos controlados, laboratorios de seguridad o sistemas para los cuales se tiene permiso explícito y por escrito del propietario.

**El uso de estos payloads para atacar sistemas sin permiso es ilegal y poco ético.** El creador y los colaboradores de este repositorio no se hacen responsables de ningún uso indebido o daño causado por el contenido aquí provisto. ¡Usa tus habilidades de manera responsable!

---

## 🗂️ Estructura del Repositorio (V2.0)

La nueva estructura clasifica los *payloads* rigurosamente según el **tipo de vulnerabilidad** y la **técnica de explotación o evasión** requerida.

### 💉 I. SQL Injection (SQLi)

| Ruta | Clasificación | Propósito de Uso |
| :--- | :--- | :--- |
| `SQLi/Payloads/` | **Extracción de Datos** | Contiene payloads base clasificados por el método de extracción: **Error-Based**, **Union-Based**, **Time-Based** y **Boolean-Based**.  |
| `SQLi/Techniques/` | **Evasión de Sentencia** | Contiene técnicas para manipular la consulta SQL (ej., `Comments`) para neutralizar el resto de la sentencia original. |

### 🌐 II. Cross-Site Scripting (XSS)

| Ruta | Clasificación | Propósito de Uso |
| :--- | :--- | :--- |
| `XSS/Payloads/` | **Mecanismo Web** | Payloads clasificados por su ubicación de ejecución: **Reflected**, **Stored**, y **DOM-Based**.  |
| `XSS/Evasion/` | **Filtros/WAF Bypass** | Técnicas avanzadas para eludir defensas, clasificadas por: **Encoding** (codificaciones), **Context-Bypass** (escape de contextos HTML/JS) y **WAF-Bypass** (ofuscación general). |

---

## 🔗 Guía de Flujo de Trabajo (Aprochear)

El flujo recomendado para el uso de estos *payloads* sigue una metodología de Pen-Testing estructurada:

1.  **Detección (Fuzzing):**
    * Usar un *payload* de bajo impacto (ej. `XSS/Payloads/Reflected/reflected_payloads.txt` o `SQLi/Payloads/Boolean_Based/boolean_based_payloads.txt` con `AND 1=1 --`) para confirmar la presencia de una vulnerabilidad.

2.  **Clasificación y Contexto:**
    * Determinar el tipo exacto (ej., XSS Reflejado en un atributo `href`, o SQLi Ciego Booleano).

3.  **Explotación (Payload Específico):**
    * Seleccionar el payload más adecuado de las subcarpetas (ej. `SQLi/Payloads/Union_Based/` si la extracción de datos es visible).

4.  **Evasión (Si hay Filtros):**
    * Si el payload falla, recurrir a las carpetas `XSS/Evasion/` o `SQLi/Techniques/` para aplicar codificación o técnicas de *context break*.

5.  **Automatización:**
    * Usar `toolkit.sh` para probar listas completas de *payloads* en un parámetro de entrada.

---

## ⚙️ Utilidades y Herramientas

### `toolkit.sh` (Script Maestro)

Este script (`toolkit.sh`) permite tomar una lista de *payloads* desde cualquier archivo `.txt` y enviarlos automáticamente a un parámetro de URL específico usando `curl`, manejando la codificación básica.

**Uso:**

```bash
# SINTAXIS: ./toolkit.sh <ruta_al_payloads.txt> <URL_base> <nombre_del_parametro>

# Ejemplo: Probar payloads de XSS reflejado en el parámetro 'query'
./toolkit.sh ./XSS/Payloads/Reflected/reflected_payloads.txt "[http://target.com/search](http://target.com/search)" "query"
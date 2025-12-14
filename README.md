# 🔱 Payload Arsenal: SQLi & XSS (v2.0 Refactor)

Colección organizada de **recursos y *payloads*** para la **Validación de Seguridad** y el **Pentesting Ético** de aplicaciones web. Este repositorio presenta una **re-arquitectura (v2.0)** del contenido, enfocada en la usabilidad profesional, la clasificación metodológica y la inclusión de guías de mitigación esenciales.

-----

## ⚠️ Descargo de Responsabilidad Ético (Disclaimer)

El contenido de este repositorio tiene fines puramente **educativos y de seguridad defensiva**. Está diseñado para ser utilizado exclusivamente en entornos controlados, laboratorios de seguridad, o sistemas para los cuales el usuario tiene **permiso explícito, por escrito y legalmente vinculante** del propietario.

**El uso de estos *payloads* para atacar sistemas sin autorización previa es ilegal, poco ético y constituye una violación de la política de uso de este proyecto.** El creador y los colaboradores no se hacen responsables de ningún uso indebido o daño causado por el contenido aquí provisto.

-----

## 🗂️ Estructura del Repositorio (V2.0)

La estructura clasifica los recursos según la **vulnerabilidad**, la **técnica de explotación** y la **mitigación requerida**.

### 💉 I. SQL Injection (SQLi)

| Ruta | Clasificación | Propósito de Uso |
| :--- | :--- | :--- |
| `SQLi/Payloads/` | **Extracción de Datos** | Contiene *payloads* base clasificados por el método de extracción (ej., **Error-Based**, **Union-Based**, **Time-Based**, **Boolean-Based**).  |
| `SQLi/Techniques/` | **Evasión de Sentencia** | Técnicas para manipular la consulta SQL original (ej., `Comments`) para modificar o neutralizar el resto de la sentencia original. |
| `SQLi/Defensive_Measures/` | **Mitigación y Defensa** | **[NUEVO]** Guías técnicas sobre la prevención de SQLi, incluyendo **Sentencias Preparadas** y el **Principio del Mínimo Privilegio**. |

### 🌐 II. Cross-Site Scripting (XSS)

| Ruta | Clasificación | Propósito de Uso |
| :--- | :--- | :--- |
| `XSS/Payloads/` | **Mecanismo Web** | *Payloads* clasificados por su ubicación de ejecución en el navegador: **Reflected**, **Stored**, y **DOM-Based**. |
| `XSS/Evasion/` | **Filtros/WAF Bypass** | Técnicas avanzadas para eludir *Web Application Firewalls (WAF)* y filtros de entrada, clasificadas por: **Encoding**, **Context-Bypass** y **WAF-Bypass**. |
| `XSS/Defensive_Measures/` | **Mitigación y Defensa** | **[NUEVO]** Guías técnicas cruciales sobre la **Codificación de Salida (Output Encoding)** basada en el contexto (HTML Body, JavaScript Data, etc.). |

-----

## 🔗 Metodología de Uso (Flujo de Trabajo)

Este repositorio apoya el ciclo de *Pentesting* con un enfoque en la **precisión** y la **prevención**:

1.  **Detección y Clasificación:** Usar *payloads* iniciales de bajo impacto para confirmar la vulnerabilidad y clasificar el tipo exacto (ej. Union-Based, Reflected).
2.  **Explotación Controlada:** Seleccionar *payloads* de las carpetas `Payloads/` para la extracción de datos o la prueba de ejecución de código.
3.  **Análisis de Filtros:** Si la prueba inicial falla, investigar la carpeta `Evasion/` para aplicar la codificación o la técnica de *bypass* adecuada.
4.  **Validación Defensiva:** Consultar `Defensive_Measures/` para entender la solución de código fuente correcta y validar que la aplicación la implemente correctamente.
5.  **Automatización:** Utilizar `toolkit.sh` para la prueba sistemática de los *payloads* en un entorno *fuzzing* autorizado.

-----

## ⚙️ Utilidades y Herramientas

### `toolkit.sh` (Script Maestro)

Diseñado para automatizar el *fuzzing* de parámetros. Este script permite probar colecciones completas de *payloads* (`.txt`) contra un punto final de prueba:

```bash
./toolkit.sh <ruta_al_payloads.txt> <URL_base> <nombre_del_parametro>
```

### `organize.sh`

Script de utilidad para mantener los archivos `.txt` de *payloads* ordenados, limpiar duplicados o aplicar un formato de comentario estándar.

-----

## 📝 Contribución y Licencia

Agradecemos cualquier contribución que siga la estructura de clasificación V2.0 y añada guías de mitigación claras.

  * Lee el archivo `CONTRIBUTING.md` antes de enviar un *Pull Request*.
  * Este proyecto está bajo la licencia especificada en `LICENSE`.

-----
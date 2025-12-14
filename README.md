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
|------|--------------|------------------|
| `SQLi/Payloads/` | **Extracción de Datos** | Contiene payloads base clasificados por el método de extracción: **Error-Based**, **Union-Based**, **Time-Based** y **Boolean-Based**. |
| `SQLi/Techniques/` | **Evasión de Sentencia** | Contiene técnicas para manipular la consulta SQL (ej., `Comments`) para neutralizar el resto de la sentencia original. |

### 🌐 II. Cross-Site Scripting (XSS)

| Ruta | Clasificación | Propósito de Uso |
|------|--------------|------------------|
| `XSS/Payloads/` | **Mecanismo Web** | Payloads clasificados por su ubicación de ejecución: **Reflected**, **Stored**, y **DOM-Based**. |
| `XSS/Evasion/` | **Filtros/WAF Bypass** | Técnicas avanzadas para eludir defensas, clasificadas por: **Encoding**, **Context-Bypass** y **WAF-Bypass**. |

---

## 🔗 Guía de Flujo de Trabajo (Approach)

1. **Detección (Fuzzing):**
   - Usar un payload de bajo impacto para confirmar la vulnerabilidad.

2. **Clasificación y Contexto:**
   - Identificar el tipo exacto de vulnerabilidad.

3. **Explotación (Payload Específico):**
   - Seleccionar payloads adecuados según el vector.

4. **Evasión (Si hay Filtros):**
   - Aplicar técnicas de bypass y codificación.

5. **Automatización:**
   - Uso de `toolkit.sh` para pruebas masivas.

---

## ⚙️ Utilidades y Herramientas

### `toolkit.sh` (Script Maestro)

```bash
./toolkit.sh <ruta_al_payloads.txt> <URL_base> <nombre_del_parametro>
```

---

## 📝 Contribución y Licencia

Agradecemos cualquier contribución que siga la estructura de clasificación V2.0.

Lee `CONTRIBUTING.md` antes de enviar un Pull Request.

Este proyecto está bajo la licencia especificada en `LICENSE`.

## 🔥 Payload Arsenal: SQLi & XSS (v2.0 Refactor)

Colección esencial y **estrictamente organizada** de *payloads* y recursos para la **Validación de Seguridad** y el **Pentesting Ético** de aplicaciones web.

Este repositorio es un **flujo de trabajo** completo (**V2.0**), diseñado para la **eficiencia operativa** y la integración de la seguridad **defensiva** directamente con las técnicas de ataque.

-----

## ⚠️ Descargo de Responsabilidad Ético (Disclaimer)

**Propósito:** Puramente educativo y de prueba de seguridad legal.

**Uso Autorizado:** Exclusivamente en entornos controlados, sistemas propios o sistemas de terceros **con permiso explícito, escrito y legalmente válido** (Contrato de Pentesting o Bug Bounty).

**El uso ilegal o no autorizado es responsabilidad del usuario.** El creador y los colaboradores no tienen ninguna responsabilidad por el mal uso de las herramientas aquí contenidas.

-----

## 🗂️ Estructura del Arsenal (V2.0)

La estructura clasifica los recursos cubriendo el ciclo completo: **Detección, Explotación y Mitigación**.

### 💉 I. Inyección SQL (SQLi)

| Ruta | Clasificación | Aporte a la Práctica |
| :--- | :--- | :--- |
| `SQLi/Payloads/` | **Extracción de Datos** | *Payloads* base organizados por técnica de explotación: **Error-Based** (para *debug*), **Union-Based** (para extracción directa), **Time-Based** y **Boolean-Based** (para *Blind SQLi* en entornos silenciosos). |
| `SQLi/Techniques/` | **Evasión de Sentencia** | Fragmentos y estructuras para **manipular la lógica de la consulta** (ej., uso de `Comments` para modificar sentencias originales). |
| `SQLi/Defensive_Measures/` | **Mitigación | [CRUCIAL]** Guías técnicas sobre cómo cerrar la puerta. Incluye **Sentencias Preparadas** (la defensa \#1) y el **Principio del Mínimo Privilegio** (defensa de última línea). |

### 🌐 II. Cross-Site Scripting (XSS)

| Ruta | Clasificación | Aporte a la Práctica |
| :--- | :--- | :--- |
| `XSS/Payloads/` | **Mecanismo Web** | Payloads clasificados por dónde impactan: **Reflected** (vía URL), **Stored** (vía DB/servidor) y **DOM-Based** (vía JS del cliente). |
| `XSS/Evasion/` | **Filtros/WAF Bypass** | Técnicas avanzadas para **esquivar filtros**. Clasificadas por el método: **Encoding** (codificación alternativa), **Context-Bypass** (cambio de contexto) y **WAF-Bypass** (evasión activa del firewall). |
| `XSS/Defensive_Measures/` | **Mitigación | [CLAVE]** Guías técnicas sobre la única defensa efectiva: la **Codificación de Salida (Output Encoding)**, específica para cada contexto de renderizado (HTML, JS, URL). |

-----

## 🔗 Utilidad Práctica: Flujo de Trabajo

Este repositorio permite practicar el ciclo de *Pentesting* con un enfoque en la **precisión** y la **prevención**:

1.  **Detección y Clasificación:** Usar *payloads* iniciales para confirmar la vulnerabilidad y clasificar el tipo exacto (ej. Union-Based, Reflected).
2.  **Explotación Dirigida:** Seleccionar el *payload* más limpio y específico de la carpeta `Payloads/`.
3.  **Adaptación (Evasión):** Si hay filtros, refinar el *payload* usando las técnicas de `Evasion/`.
4.  **Validación Defensiva:** Consultar **`Defensive_Measures/`** para documentar **cómo el desarrollador debe corregir la vulnerabilidad**.

## ⚙️ Herramientas y Automatización

### `toolkit.sh` (El Motor de Fuzzing)

**Utilidad:** Diseñado para automatizar el *fuzzing* de parámetros. Permite probar colecciones completas de *payloads* (`.txt`) contra un *endpoint* de prueba autorizado de forma sistemática y repetible.

```bash
./toolkit.sh <ruta_al_payloads.txt> <URL_base> <nombre_del_parametro>
```

### `organize.sh`

**Utilidad:** Script de utilidad para mantener los archivos `.txt` de *payloads* ordenados, limpiar duplicados o aplicar un formato de comentario estándar antes de la contribución.

-----

## 📝 Colaboración y Propiedad

**Aporte:** Aceptamos contribuciones que añadan *payloads* funcionales o guías de mitigación claras, siempre que se adhieran a la estructura de clasificación V2.0.

  * **Contribución:** Consulta `CONTRIBUTING.md` para las pautas de envío.
  * **Licencia:** Definida en `LICENSE`.
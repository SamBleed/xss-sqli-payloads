## 📂 `XSS/Defensive_Measures/Output_Encoding_Contexts.md` (Contenido Expandido)

### \# 🛡️ Guía: Codificación de Salida (Output Encoding) y Contextos

La Codificación de Salida es el método esencial para prevenir la mayoría de los ataques XSS (Reflected y Stored). Consiste en tratar la entrada no confiable como **datos puros** al momento de la renderización, no como comandos.

**La Regla Fundamental:** **Codifica siempre para el contexto específico** donde se insertarán los datos.

### \#\# 1. Contexto de Cuerpo HTML (HTML Body Context)

Este es el caso más común: cuando el dato aparece directamente dentro de las etiquetas, como en `<div>...aquí...</div>`.

| Caracteres a Codificar | Conversión Típica |
| :--- | :--- |
| `<` | `&lt;` |
| `>` | `&gt;` |
| `&` | `&amp;` |
| `"`, `'` | `&quot;`, `&#x27;` (Opcional, pero recomendado) |

**Vulnerabilidad:** Un atacante inyecta `<script>` o `<img>` para ejecutar JavaScript.

**Código Defensivo (PHP con `htmlspecialchars`):**

```php
<?php
// Entrada maliciosa: "Hola <script>alert(1)</script> Mundo"
$user_input = $_GET['nombre'];

// La función convierte < y > a entidades.
$safe_output = htmlspecialchars($user_input, ENT_QUOTES, 'UTF-8');
?>

<div>
    Hola <?= $safe_output ?> Mundo 
    </div>
```

### \#\# 2. Contexto de Atributo HTML (HTML Attribute Context)

Ocurre cuando el dato aparece dentro de las comillas de un atributo HTML, como en `<input value="...">` o `title="..."`.

| Regla | Descripción |
| :--- | :--- |
| **Attribute Encoding** | Codificar todos los caracteres no alfanuméricos excepto los permitidos para el atributo. **Si usas `htmlspecialchars` (como en el ejemplo de PHP), asegúrate de que use `ENT_QUOTES` para cubrir ambas comillas (`"` y `'`).** |
| **Evitar Atributos Peligrosos** | **NUNCA** usar entrada de usuario en atributos de manejador de eventos (ej. `onmouseover`) o atributos de URL (ej. `href`, `src`) sin una validación estricta. |

**Vulnerabilidad:** Un atacante cierra el atributo y añade un manejador de eventos: `valor" onmouseover="alert(1)`

**Código Defensivo (PHP con `htmlspecialchars`):**

```php
<?php
// Entrada maliciosa: nombre" onmouseover="alert(1)
$user_input = $_GET['nombre'];
$safe_output = htmlspecialchars($user_input, ENT_QUOTES, 'UTF-8');
?>

<input type="text" name="name" value="<?= $safe_output ?>">
```

### \#\# 3. Contexto de Datos JavaScript (JavaScript Data Context)

Ocurre cuando la entrada del usuario se inserta dentro de un bloque `<script>`, generalmente para inicializar variables.

| Regla | Descripción |
| :--- | :--- |
| **JSON Encoding** | Usar una función que codifique el dato de manera que sea una cadena JSON válida (ej. `json_encode` en PHP). Esto codifica las comillas, *backslashes* y saltos de línea con notación Unicode. |
| **Prohibido** | **NUNCA** permitir que la entrada de usuario se inyecte directamente en ubicaciones peligrosas como `document.write`, `.innerHTML`, o **dentro de comillas simples sin codificación rigurosa**. |

**Vulnerabilidad:** Un atacante cierra la cadena y añade un comando: `'; alert(1); var x='`

**Código Defensivo (PHP con `json_encode`):**

```php
<?php
// Entrada maliciosa: '; alert(1); var x='
$user_input = $_GET['id'];
?>

<script>
    // SEGURO: json_encode() garantiza que la entrada sea una cadena literal JS.
    var user_id = <?= json_encode($user_input) ?>; 
    
    // Si la entrada es la maliciosa, el output es:
    // var user_id = "'; alert(1); var x='"; // Sigue siendo solo texto dentro de la variable
</script>
```

### \#\# 4. Contexto de URL (URL Query Parameter Context)

Ocurre cuando la entrada del usuario se utiliza para construir un parámetro de URL o una URL completa dentro de una etiqueta `href` o `src`.

| Regla | Descripción |
| :--- | :--- |
| **URL Encoding** | Codificar todos los caracteres especiales usando *Percent Encoding* (`%XX`). Esto asegura que el navegador no vea caracteres como `&` o `?` como separadores de URL o fin de cadena, sino como parte del parámetro. |

**Vulnerabilidad:** Un atacante inyecta un protocolo malicioso (ej. `javascript:`) o rompe el parámetro.

**Código Defensivo (PHP con `urlencode`):**

```php
<?php
// Entrada maliciosa: página&param=valor
$user_input = $_GET['page'];
$safe_output = urlencode($user_input);
?>

<a href="/ayuda?p=<?= $safe_output ?>">Ayuda</a>
```

-----
# 🛡️ Guía: Uso de Sentencias Preparadas (Prepared Statements)
Las Sentencias Preparadas (o Consultas Parametrizadas) son la principal defensa contra la Inyección SQL (SQLi). Al usarlas, la consulta SQL es definida por la aplicación con parámetros de marcador de posición (? o :name) antes de que cualquier dato de entrada del usuario sea enviado.

El dato de entrada del usuario se envía más tarde, separado de la lógica de la consulta. Esto asegura que el DBMS siempre trate la entrada del usuario como datos puros, nunca como código SQL ejecutable.

## 💻 Implementación en Lenguajes Comunes
A. PHP (Usando PDO)

```PHP
<?php
// 1. Preparar la sentencia: Usar marcadores de posición (?)
$stmt = $pdo->prepare('SELECT nombre, email FROM usuarios WHERE id = ?');

// 2. Ejecutar, pasando la entrada del usuario como un parámetro separado
//    $user_input nunca es interpretado como SQL
$user_input = $_GET['user_id'];
$stmt->execute([$user_input]);

// 3. Obtener el resultado
$user = $stmt->fetch();
?>
```
B. Python (Usando psycopg2 para PostgreSQL)

```Python
import psycopg2

# Conexión a la base de datos...
conn = psycopg2.connect("...")
cur = conn.cursor()

# 1. Preparar la sentencia: Usar marcadores de posición (%s)
sql_query = "SELECT producto, precio FROM inventario WHERE categoria = %s;"

# 2. Ejecutar, pasando la entrada del usuario como una tupla
user_category = ('Electronicos',)
cur.execute(sql_query, user_category)

# 3. Obtener el resultado
results = cur.fetchall()
```

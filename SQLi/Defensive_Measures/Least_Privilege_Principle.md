## 📂 `SQLi/Defensive_Measures/Least_Privilege_Principle.md`

### \# 🛡️ Guía: Principio del Mínimo Privilegio (Principle of Least Privilege - PoLP)

El Principio del Mínimo Privilegio (PoLP) es un concepto fundamental de seguridad que establece que un usuario, proceso o programa (en este caso, la **cuenta de la base de datos de la aplicación web**) solo debe tener los **permisos estrictamente necesarios** para realizar su función designada.

En el contexto de la Inyección SQL, la implementación de este principio actúa como una defensa de **"última línea"** si un atacante logra inyectar un *payload*.

### \#\# 1. Riesgo de la Cuenta de Administrador

Muchas aplicaciones utilizan la cuenta de administrador de la base de datos (`root` o `admin`) para conectarse y ejecutar consultas.

| Permisos de la Cuenta Admin | Riesgo de SQLi |
| :--- | :--- |
| `DROP TABLE`, `CREATE DATABASE` | Un atacante puede **destruir datos** o la estructura de la base de datos completa. |
| `SELECT` en cualquier tabla | Un atacante puede usar `UNION SELECT` o *Blind SQLi* para **extraer datos sensibles** de *otras* tablas (ej. tablas de usuarios, contraseñas, o información de tarjetas de crédito). |
| `FILE_READ`/`FILE_WRITE` | Un atacante podría leer archivos internos del sistema operativo o inyectar *shells* web. |

### \#\# 2. Implementación del Mínimo Privilegio

La cuenta que utiliza tu aplicación web para conectarse a la base de datos **solo debe tener permisos en las tablas y columnas que necesita para la función de la aplicación**.

**Ejemplo de Escenario:** Una aplicación de *e-commerce* solo necesita leer los productos y escribir los pedidos.

| Permiso | ¿Necesario para la Aplicación? |
| :---: | :--- |
| `SELECT` en la tabla `productos` | ✅ SÍ (Para mostrar el catálogo) |
| `INSERT` en la tabla `pedidos` | ✅ SÍ (Para registrar nuevas órdenes) |
| `DELETE` en la tabla `usuarios` | ❌ NO (Esto se debe manejar solo por el administrador o un proceso separado) |
| `DROP` en cualquier tabla | ❌ NO (Permite la destrucción de la base de datos) |
| Acceso a `mysql.user` (Tablas de sistema) | ❌ NO (Permite extraer credenciales de otros usuarios) |

### \#\# 3. Código de Ejemplo (MySQL/MariaDB)

Para crear una cuenta de base de datos segura y específica, sigue estos pasos:

1.  **Crear el Usuario Específico de la Aplicación:**

    ```sql
    -- Reemplaza 'app_user' y 'TuPasswordSegura'
    CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'TuPasswordSegura';
    ```

2.  **Otorgar Solo los Permisos Necesarios:**

    ```sql
    -- Otorgar SELECT, INSERT, UPDATE en las tablas necesarias
    GRANT SELECT, INSERT, UPDATE ON tu_base_de_datos.productos TO 'app_user'@'localhost';
    GRANT SELECT, INSERT ON tu_base_de_datos.pedidos TO 'app_user'@'localhost';

    -- Si necesita ejecutar procedimientos almacenados específicos (y son seguros)
    GRANT EXECUTE ON PROCEDURE tu_base_de_datos.obtener_resumen TO 'app_user'@'localhost';
    ```

3.  **Verificar y Limpiar:**

    Asegúrate de **no otorgar permisos generales** como `GRANT ALL ON *.*` o `GRANT ALL ON tu_base_de_datos.*`.

Al implementar esta defensa, si un atacante logra inyectar un *payload* `DROP TABLE`, el ataque **fallará** porque la cuenta `app_user` simplemente no tiene el permiso para ejecutar ese comando.

-----
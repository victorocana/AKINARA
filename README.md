# AKIHABARA DB - GUÍA DE USO Y PUESTA EN MARCHA

## 1. CONFIGURAR LA BASE DE DATOS (MySQL)

- Primero, asegurate de tener **MySQL instalado y en ejecución**.
- Crea la base de datos con este comando:

  ```sql <br>
  
  CREATE DATABASE akihabara;
  ```

- Después ponla en uso:

  ```sql <br>
  
  USE akihabara;
  ```
  
- Y crea la tabla de productos: <br>
  ```sql <br>
  
  CREATE TABLE productos ( <br>
      id INT AUTO_INCREMENT PRIMARY KEY, <br>
      nombre VARCHAR(100), <br>
      categoria VARCHAR(100), <br>
      precio DOUBLE, <br>
      stock INT, <br>
      descripcion TEXT <br>
  );
  ```

- Si usas un archivo de configuración tipo `conexion.properties`, deberías tener algo así:

  ```
  db.url=jdbc:mysql://localhost:3306/akihabara  
  db.user=(el usuario que tengas configurada)<br>
  db.password= (la contraseña que tengas configurada)
  ```

## 2. CONFIGURAR LA API KEY DE OPENROUTER

- Pon tu API key en una variable de entorno llamada `OPENROUTER_API_KEY`.

- Alternativa: se puede crear un archivo externo con extensiónn `.env` con este contenido:

  ```
  OPENROUTER_API_KEY="Aquí iría tu API KEY"
  ```

- El programa busca esa variable automáticamente. Si no la encuentra, usa una clave de prueba (aunque lo mejor es poner la tuya).

## 3. COMPILAR Y EJECUTAR LA APLICACIÓN

- Necesitas tener **Java (JDK 17 o más nuevo)** y **MySQL**.

- También hay que descargar el **conector JDBC** (`mysql-connector-j.jar`) para conectar con MySQL.

- Para compilar desde terminal:

  ```bash <br>
  javac -cp .;ruta/mysql-connector-j.jar -d bin src/**/*.java
  ```

- Para ejecutar:

  ```bash <br>
  java -cp .;bin;ruta/mysql-connector-j.jar main.Main
  ```

  > (Reemplaza `main.Main` por la clase donde esté tu `main()`)

- Si usas **IntelliJ** o **Eclipse**:
  - Añade el conector JDBC al proyecto.
  - Ejecuta la clase que tenga el método `main`.

## 4. FUNCIONALIDADES

- Agregar, buscar, actualizar, eliminar y listar productos.
- Generar descripciones con IA (usando OpenRouter).
- Sugerir categorías automáticamente.
- Completar descripciones vacías en lote.

## 5. ESTRUCTURA DE CLASES

- `ProductoOtaku`: contiene los datos del producto.
- `ProductoDAO`: maneja todo lo de la base de datos.
- `LlmService`: se conecta con la API para generar contenido. Dicha API debe estar configurada en un `.env`.
- `InterfazConsola`: la parte visible por consola.
- `Main`: arranque principal de la app.

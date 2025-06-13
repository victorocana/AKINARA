	AKIHABARA DB - GUÍA RÁPIDA
	==========================
	
	1. CONFIGURAR LA BASE DE DATOS (MySQL)
	--------------------------------------
	- Primero, asegurate de tener MySQL instalado y funcionando.
	- Creá la base de datos con este comando:
	
	  CREATE DATABASE akihabara;
	
	- Después usala:
	
	  USE akihabara;
	
	- Y creá la tabla de productos:
	
	  CREATE TABLE productos (
	      id INT AUTO_INCREMENT PRIMARY KEY,
	      nombre VARCHAR(100),
	      categoria VARCHAR(100),
	      precio DOUBLE,
	      stock INT,
	      descripcion TEXT
	  );
	
	- Si usás un archivo de configuración tipo `conexion.properties`, debería tener algo así:
	
	  db.url=jdbc:mysql://localhost:3306/akihabara  
	  db.user=tu_usuario  
	  db.password=tu_contraseña
	
	2. CONFIGURAR LA API KEY DE OPENROUTER
	--------------------------------------
	- Poné tu API key en una variable de entorno llamada `OPENROUTER_API_KEY`.
	
	- Alternativa: podés crear un archivo `.env` con este contenido:
	
	  OPENROUTER_API_KEY=tu_api_key_aqui
	
	- El programa busca esa variable automáticamente. Si no la encuentra, usa una clave de prueba (aunque lo mejor es poner la tuya).
	
	3. COMPILAR Y EJECUTAR LA APLICACIÓN
	------------------------------------
	- Necesitás tener Java (JDK 17 o más nuevo) y MySQL.
	
	- También tenés que descargar el conector JDBC (`mysql-connector-j.jar`) para conectar con MySQL.
	
	- Para compilar desde terminal:
	
	  javac -cp .;ruta/mysql-connector-j.jar -d bin src/**/*.java
	
	- Para ejecutar:
	
	  java -cp .;bin;ruta/mysql-connector-j.jar main.Main
	
	  (Reemplazá `main.Main` por la clase donde está tu `main()`)
	
	- Si usás IntelliJ o Eclipse:
	  - Agregá el conector JDBC al proyecto.
	  - Corré la clase que tenga el método `main`.
	
	4. FUNCIONALIDADES
	------------------
	- Agregar, buscar, actualizar, eliminar y listar productos.
	- Generar descripciones con IA (usando OpenRouter).
	- Sugerir categorías automáticamente.
	- Completar descripciones vacías en lote.
	
	5. ESTRUCTURA DE CLASES
	-----------------------
	- `ProductoOtaku`: contiene los datos del producto.
	- `ProductoDAO`: maneja todo lo de la base de datos.
	- `LlmService`: se conecta con la API para generar contenido. Dicha API debe estar configurada en un .env 
	- `InterfazConsola`: la parte visible por consola.
	- `Main`: arranque principal de la app.

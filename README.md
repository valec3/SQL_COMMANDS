# SQL CHEAT SHEET
## Table of Contents
- [SQL CHEAT SHEET](#sql-cheat-sheet)
  - [Table of Contents](#table-of-contents)
  - [Connect to MySQL](#connect-to-mysql)
  - [Data Definition Language](#data-definition-language)
  - [Data Control Language](#data-control-language)
    - [GRANT](#grant)
    - [REVOKE](#revoke)
  - [Transaction Control Language](#transaction-control-language)
  - [SQL Commands](#sql-commands)
    - [SELECT](#select)
    - [WHERE](#where)
    - [INSERT](#insert)
    - [UPDATE](#update)
    - [DELETE](#delete)
    - [JOINS](#joins)
    - [UNION](#union)
    - [TRIGGERS](#triggers)
    - [VIEWS](#views)

## Connect to MySQL
Conectar a MySQL desde la terminal.

```bash
mysql -u root -p
```
Crear usuario y contraseña.
```sql
CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'contraseña';
```
Dar privilegios al usuario.
```sql
GRANT ALL PRIVILEGES ON *.* TO 'usuario'@'localhost';
```
Actualizar privilegios.
```sql
FLUSH PRIVILEGES;
```
Salir de MySQL.
```sql
exit
```

## Data Definition Language
- CREATE DATABASE:
Crea una nueva base de datos.
```sql
CREATE DATABASE basededatos;
```

- CREATE TABLE:
Crea una nueva tabla en la base de datos(seleccionar la base de datos a usar).
```sql
CREATE TABLE tabla (
    columna1 INT NOT NULL,
    columna2 VARCHAR(45) NULL,
    PRIMARY KEY (columna1)
);
```
- ALTER TABLE:
Modifica la estructura de una tabla existente.
```sql
--- Agregar columna
ALTER TABLE tabla ADD columna3 VARCHAR(45) NULL;
```
```sql
--- Eliminar columna
ALTER TABLE tabla DROP COLUMN columna3;
```
```sql
--- Modificar columna
ALTER TABLE tabla MODIFY COLUMN columna2 VARCHAR(50) NULL;
```
```sql
--- Renombrar tabla
ALTER TABLE tabla RENAME TO tabla2;
```
- DROP TABLE:
Elimina una tabla de la base de datos.
```sql
DROP TABLE tabla;
```
- DROP DATABASE:
Elimina una base de datos.
```sql
DROP DATABASE basededatos;
``` 
- TRUNCATE TABLE:
Elimina todos los registros de una tabla.
```sql
TRUNCATE TABLE tabla;
```
- CREATE INDEX:
Crea un índice en una tabla.
```sql
CREATE INDEX index_name ON tabla (columna);
```


## Data Control Language
### GRANT
- ALL PRIVILEGES:
Este privilegio otorga al usuario todos los derechos sobre una base de datos específica. Esto incluye la capacidad de crear, modificar, eliminar y ver tablas, así como realizar todas las operaciones SQL.

```sql
GRANT ALL PRIVILEGES ON basededatos.* TO 'usuario'@'localhost';
```
- SELECT:
 Permite al usuario realizar consultas SELECT en las tablas de la base de datos para ver datos.
```sql
GRANT SELECT ON basededatos.tabla TO 'usuario'@'localhost';
```
- INSERT:
 Permite al usuario agregar nuevos registros a una tabla.

```sql
GRANT INSERT ON basededatos.tabla TO 'usuario'@'localhost';
```
- UPDATE:
Permite al usuario modificar registros existentes en una tabla.

```sql
GRANT UPDATE ON basededatos.tabla TO 'usuario'@'localhost';
```
- DELETE:
Permite al usuario eliminar registros de una tabla.
```sql
GRANT DELETE ON basededatos.tabla TO 'usuario'@'localhost';
```
- CREATE:
Permite al usuario crear nuevas tablas en la base de datos.
```sql
GRANT CREATE ON basededatos.* TO 'usuario'@'localhost';
```
- ALTER:
Permite al usuario modificar la estructura de las tablas existentes.
```sql
GRANT ALTER ON basededatos.* TO 'usuario'@'localhost';
```
- DROP:
Permite al usuario eliminar tablas de la base de datos.
```sql
GRANT DROP ON basededatos.* TO 'usuario'@'localhost';
```
- GRANT OPTION:
Permite al usuario otorgar sus propios privilegios a otros usuarios.
```sql
GRANT GRANT OPTION ON basededatos.* TO 'usuario'@'localhost';
```
- EXECUTE:
Utilizado en bases de datos que admiten procedimientos almacenados, este privilegio permite al usuario ejecutar procedimientos almacenados.
```sql
GRANT EXECUTE ON PROCEDURE basededatos.procedimiento TO 'usuario'@'localhost';
```
- VER PRIVILEGIOS DE UN USUARIO:
Muestra los privilegios que tiene un usuario sobre una base de datos.
```sql
SHOW GRANTS FOR 'nombre_usuario'@'localhost';
```
- Actualizar privilegios.
```sql
FLUSH PRIVILEGES;
```

### REVOKE
- ALL PRIVILEGES:
Este privilegio revoca todos los derechos de un usuario sobre una base de datos específica. Esto incluye la capacidad de crear, modificar, eliminar y ver tablas, así como realizar todas las operaciones SQL.
```sql
REVOKE ALL PRIVILEGES ON basededatos.* FROM 'usuario'@'localhost';
```
- SELECT:
Revoca el privilegio SELECT de un usuario sobre una tabla.
```sql
REVOKE SELECT ON basededatos.tabla FROM 'usuario'@'localhost';
```
...

## Transaction Control Language
- COMMIT:
Guarda los cambios realizados en la base de datos.
```sql
COMMIT;
```
- ROLLBACK:
Revierte los cambios realizados en la base de datos.
```sql
ROLLBACK;
```
- SAVEPOINT:
Establece un punto de guardado dentro de una transacción.
```sql
SAVEPOINT savepoint_name;
```
- RELEASE SAVEPOINT:
Elimina un punto de guardado.
```sql
RELEASE SAVEPOINT savepoint_name;
```
- SET TRANSACTION:
Establece las características de una transacción.
```sql
SET TRANSACTION READ WRITE;
```
- START TRANSACTION:
Inicia una transacción.
```sql
START TRANSACTION;
```
- SET AUTOCOMMIT:
Habilita o deshabilita la confirmación automática de cada sentencia SQL.
```sql
SET AUTOCOMMIT = 1;
```
- EXAMPLES:
  - Ejemplo 1: Realizar una transacción que actualice una tabla y luego confirmar los cambios.

    ```sql
    START TRANSACTION;
    UPDATE tabla SET columna1 = 1 WHERE columna2 = 2;
    COMMIT;
    ```

  - Ejemplo 2: Realizar una transacción que actualice una tabla y luego revertir los cambios.

    ```sql
    START TRANSACTION;
    UPDATE tabla SET columna1 = 1 WHERE columna2 = 2;
    ROLLBACK;
    ```

.......................................................

## SQL Commands
### SELECT
- SELECT:
Selecciona datos de una base de datos.
    ```sql
    SELECT columna1, columna2 FROM tabla;
    ```
- SELECT DISTINCT:
Selecciona datos de una base de datos sin duplicados.
    ```sql
    SELECT DISTINCT columna1, columna2 FROM tabla;
    ```
- SELECT INTO:
Copia datos de una tabla a una nueva tabla.
    ```sql
    SELECT columna1, columna2 INTO tabla2 FROM tabla;
    ```
- SELECT TOP:
Selecciona los primeros registros de una tabla.
    ```sql
    SELECT TOP 5 columna1, columna2 FROM tabla;
    ```
- SELECT WHERE:
Selecciona datos de una base de datos que cumplan con una condición.
    ```sql
    SELECT columna1, columna2 FROM tabla WHERE columna1 = 1;
    ```
### WHERE
- AND:
Selecciona datos que cumplan con dos condiciones.
    ```sql
    SELECT columna1, columna2 
    FROM tabla 
    WHERE columna1 = 1 AND columna2 = 2;
    ```
- BETWEEN:
Selecciona datos dentro de un rango.
    ```sql
    SELECT columna1, columna2 
    FROM tabla 
    WHERE columna1 BETWEEN 1 AND 5;
    ```
- EXISTS:
Selecciona datos si existe un registro en una subconsulta.
    ```sql
    SELECT columna1, columna2 
    FROM tabla WHERE EXISTS (SELECT columna1 FROM tabla2 
    WHERE columna1 = 1);
    ```
- IN:
Selecciona datos si coinciden con cualquiera de los valores de una lista.
    ```sql
    SELECT columna1, columna2 
    FROM tabla 
    WHERE columna1 IN (1, 2, 3);
    ```
- LIKE:
Selecciona datos que coincidan con un patrón.
    ```sql
    SELECT columna1, columna2 
    FROM tabla 
    WHERE columna1 LIKE 'a%';
    ```
- NOT:
Selecciona datos que no cumplan con una condición.
    ```sql
    SELECT columna1, columna2 
    FROM tabla 
    WHERE NOT columna1 = 1;
    ```
- OR:
Selecciona datos que cumplan con al menos una de las condiciones.
    ```sql
    SELECT columna1, columna2 
    FROM tabla 
    WHERE columna1 = 1 OR columna2 = 2;
    ```
### INSERT
- INSERT INTO:
Inserta nuevos registros en una tabla.
    ```sql
    INSERT INTO tabla (columna1, columna2) VALUES (1, 'a');
    ```
    Insertar varios registros

    ```sql
    INSERT INTO tabla (columna1, columna2) 
        VALUES (1, 'a'), (2, 'b'), (3, 'c');
    ```
  
- INSERT INTO SELECT:
Inserta nuevos registros en una tabla desde otra tabla.
    ```sql
    INSERT INTO tabla2 (columna1, columna2) 
    SELECT columna1, columna2 FROM tabla;
    ```

### UPDATE

- UPDATE:
Actualiza registros en una tabla.
    ```sql
    UPDATE tabla SET columna1 = 1 WHERE columna2 = 2;
    ``` 
- UPDATE SELECT:
Actualiza registros en una tabla desde otra tabla.
    ```sql
    UPDATE tabla SET columna1 = 1 
    FROM tabla2 
    WHERE tabla.columna2 = tabla2.columna2;
    ```
### DELETE
- DELETE:
Elimina registros de una tabla.
    ```sql
    DELETE FROM tabla WHERE columna1 = 1;
    ``` 

### JOINS
- INNER JOIN:
Combina registros de dos tablas.
    ```sql
    SELECT columna1, columna2 
    FROM tabla1 
    INNER JOIN tabla2 ON tabla1.columna1 = tabla2.columna1;
    ``` 
- LEFT JOIN:
Combina registros de dos tablas, incluyendo todos los registros de la primera tabla.
    ```sql
    SELECT columna1, columna2 
    FROM tabla1 
    LEFT JOIN tabla2 ON tabla1.columna1 = tabla2.columna1;
    ```
- RIGHT JOIN:
Combina registros de dos tablas, incluyendo todos los registros de la segunda tabla.
    ```sql
    SELECT columna1, columna2 
    FROM tabla1 
    RIGHT JOIN tabla2 ON tabla1.columna1 = tabla2.columna1;
    ```
- FULL JOIN:
Combina registros de dos tablas, incluyendo todos los registros de ambas tablas.
    ```sql
    SELECT columna1, columna2 
    FROM tabla1 
    FULL JOIN tabla2 ON tabla1.columna1 = tabla2.columna1;
    ```
- SELF JOIN:
Combina registros de una tabla consigo misma.
    ```sql
    SELECT columna1, columna2 
    FROM tabla1 t1, tabla2 t2 
    WHERE t1.columna1 = t2.columna1;
    ```
### UNION
- UNION:
Combina el resultado de dos o más consultas.
    ```sql
    SELECT columna1, columna2 FROM tabla1
    UNION
    SELECT columna1, columna2 FROM tabla2;
    ```
- UNION ALL:
Combina el resultado de dos o más consultas, incluyendo duplicados.
    ```sql
    SELECT columna1, columna2 FROM tabla1
    UNION ALL
    SELECT columna1, columna2 FROM tabla2;
    ```


### TRIGGERS
- CREATE TRIGGER:
Crea un disparador que se ejecuta cuando se inserta, actualiza o elimina registros de una tabla.
    ```sql
    CREATE TRIGGER nombre_trigger 
    AFTER INSERT ON tabla 
    FOR EACH ROW 
    BEGIN 
        -- sentencias SQL
    END;
    ```
    Ejemplo: Crear un disparador que se ejecute cuando se inserta un nuevo cliente en la tabla clientes.
    ```sql
    CREATE TRIGGER nuevo_cliente
    AFTER INSERT ON clientes
    FOR EACH ROW
    BEGIN
        INSERT INTO clientes_historial (id_cliente, nombre, apellido, fecha) 
        VALUES (NEW.id_cliente, NEW.nombre, NEW.apellido, NOW());
    END;
    ```

- DROP TRIGGER:
Elimina un disparador.
    ```sql
    DROP TRIGGER nombre_trigger;
    ```
- SHOW TRIGGERS:
Muestra los disparadores de una base de datos.
    ```sql
    SHOW TRIGGERS;
    ```

### VIEWS
- CREATE VIEW:
- DROP VIEW:
- SHOW VIEW:
- ALTER VIEW:
- CREATE OR REPLACE VIEW:
- WITH CHECK OPTION:
- WITH READ ONLY:
- WITH CASCADED CHECK OPTION:
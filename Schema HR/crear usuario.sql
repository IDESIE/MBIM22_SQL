# Ejecutar este script con un usuario que tenga los privilegios suficientes
# para realizar las operaciones siguientes. Ej. SYSTEM

# Se elimina el esquema con la finalidad de volverlo a construir
DROP USER usuario CASCADE;

# Se crea el usuario 
CREATE USER usuario -- nombre
IDENTIFIED BY USUARIO -- contraseña
DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP; --opcionalmente se especifica los tablespace a utilizar. Estos son por defecto

# Se otorga privilegios
GRANT CONNECT,RESOURCE TO usuario; -- privilegios para conectar y RESOURCE es un rol con un grupo de privilegios para poder trabajar
GRANT DEBUG CONNECT SESSION, DEBUG ANY PROCEDURE TO usuario; --necesario para depurar desde sqldeveloper

# Se realiza la conexión con el nuevo usuario
# CONNECT USUARIO/USUARIO;

# Se ejecutan los scripts para la creación de los objetos del esquema HR (esquema de ejemplo dado por Oracle)
# DEBE ejecutar los script en el siguiente orden. Teniendo en cuenta, que en este ejemplo, los tres ficheros 
# están en una carpeta llamada Schema HR en el directorio del repositorio de un sistema operativo Windows.
# DEBE modificar indicando la ruta a los ficheros.
START "%USERPROFILE%\Documents\GitHub\MBIMX_SQL\Schema HR\HR_CRE.SQL"
START "%USERPROFILE%\Documents\GitHub\MBIMX_SQL\Schema HR\HR_POPUL.SQL"
START "%USERPROFILE%\Documents\GitHub\MBIMX_SQL\Schema HR\HR_IDX.SQL"

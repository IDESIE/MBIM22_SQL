------------------------------------------------------------------------------------------------
--SELECTS SIMPLES
------------------------------------------------------------------------------------------------
/* 1
Describir la tabla floors
*/

/* 2
Describir la tabla spaces
*/

/* 3
Datos de la tabla components
*/

/* 4
Datos de la tabla component_types
*/
SELECT *
FROM COMPONENT_TYPES;
/* 5
Id, nombre de los facilities
*/

/* 6
Nombre, elevación e id del facility de las plantas
*/

/* 7
Nombre, area bruta, volumen de los espacios
*/

/* 8
Nombre, vida útil de los tipos de componentes del facility 1
*/
SELECT NAME "NOMBRE DEL TIPO DE COMPONENTE", EXPECTEDLIFE "VIDA ÚTIL"
FROM COMPONENT_TYPES
WHERE FACILITYID = 1;
/* 9
Nombre de los espacios de la Planta 1 del facility 1
*/
/*Previamente se consulta cuál es el floorid
listando los */

SELECT
    NAME, FLOORID
FROM SPACES
WHERE FLOORID = (
    SELECT ID
    FROM FLOORS
    WHERE
    NAME='Planta +1'
    and facilityid = 1);

/* 10
Nombre, número de modelo del tipo de componente con id = 60
*/

/* 11
Nombre y fecha de instalación de los componentes del espacio 60 ordenados descendentemente por la fecha de instalación
*/

/* 12
Listar las distintas fechas de instalación de los componentes del facility 1 ordenados descendentemente.
*/
SELECT COUNT(ID)"CANTIDAD DE COMPONENTES", TO_CHAR (INSTALLATEDON, 'DD-MM-YYYY')"FECHA DE INSTALACIÓN"
FROM COMPONENTS
WHERE FACILITYID = 1
GROUP BY TO_CHAR (INSTALLATEDON, 'YYYY-MM-DD'), TO_CHAR (INSTALLATEDON, 'DD-MM-YYYY')
ORDER BY TO_CHAR (INSTALLATEDON, 'YYYY-MM-DD') DESC;
/* 13
Listar los distintos GUIDs de los componentes del facility 1 ordenados ascendentemente por fecha de garantía.
*/

/* 14
Id, código de activo, GUID, número de serie y nombre de los componentes cuyo spaceid está entre 10 y 27 inclusive
ordenados por id de espacio descendentemente.
*/

/* 15
Id, código de activo, GUID, número de serie y nombre de los componentes del facility 1 
ordenados por código de activo descendentemente.
*/

/* 16
Códigos de activo de los componentes del espacio con id 21
ordenados por código de activo descendentemente.
*/
SELECT ASSETIDENTIFIER "CÓDIGO DE ACTIVO", NAME "NOMBRE DEL COMPONENTE"
FROM COMPONENTS 
WHERE SPACEID = 21
ORDER BY ASSETIDENTIFIER DESC;
/* 17
Las distintas fechas de instalación de los componentes 
de los espacios con id 10, 12, 16, 19 
ordenadas descendentemente.
*/

/* 18
Nombre, volumen, de los espacios
cuyo volumen es mayor a 90 de floorid = 1
ordenados por volumen descendentemente
*/

/* 19
Nombre, volumen de los espacios
cuyo volumen es mayor a 6 y menor a 9 de la planta con id = 1
*/

/* 20
Nombre, código de activo, número de serie de los componentes
que no tengan espacio del facility 1
ordenados descendentemente por código de activo
*/
SELECT NAME "NOMBRE DEL COMPONENTE", ASSETIDENTIFIER "CÓDIGO DE ACTIVO", SERIALNUMBER "NÚMERO DE SERIE"
FROM COMPONENTS 
WHERE SPACEID = NULL AND FACILITYID = 1
ORDER BY 2 DESC;
/* 21
Nombre, código de activo, número de serie de los componentes
que tengan número de serie del facility 1
*/

/* 22
Nombre de los espacios que empiezan por la letra A donde floorid = 1
*/

/* 23
Lista de espacios que su segunda letra es una 's' donde floorid = 1
*/

/* 24
Lista de tipos de componente del facility 1 
donde el nombre contiene el texto 'con'
y no tienen vida útil indicada o fecha de garantia 
*/ CREO QUE ESTÁ MAL
SELECT NAME
FROM COMPONENT_TYPES
WHERE FACILITYID = 1 AND NAME LIKE %con% AND EXPECTEDLIFE = NULL OR WARRANTYDURATIONPARTS = NULL;
SELECT WARRANTYDURATIONPARTS
FROM COMPONENT_TYPES;
/* 25
Nombres de espacios y volumen
pero como volumen una etiqueta que indique 
'BAJO' si es menor a 10, 'ALTO' si es mayor a 1000
y 'MEDIO' si está entre medias
*/

select 
    name, 
    volume,
    case
        when volume < 10 then 'BAJO'
        when volume > 1000  then 'ALTO'
        else 'MEDIO'
    end texto
from spaces;

/* 26
Nombre, fecha de instalación, fecha de garantia
de los componentes del facility 1
que tienen fecha de garantia
*/

/* 27
Lista de nombres de espacio que su id no es 4, 9, ni 19
del floorid 1
*/

/* 28
Lista de espacios que no son Aula del floorid = 1
*/
SELECT NAME "ESPACIOS"
FROM SPACES
WHERE NAME NOT LIKE '%Aula%' AND FLOORID = 1;
/* 29
Lista de los tipos de componentes que tienen duracion de la garantia de las partes
del facility 1
*/

/* 30
Lista de los tipos de componentes que no tiene el coste de repuesto
del facility 1
*/

/* 31
Lista de los tipos de componentes que tienen en el nombre un guión bajo
del facility 1
*/

--
------------------------------------------------------------------------------------------------

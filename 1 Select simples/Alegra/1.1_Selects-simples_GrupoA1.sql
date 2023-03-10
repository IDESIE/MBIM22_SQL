------------------------------------------------------------------------------------------------
--SELECTS SIMPLES
------------------------------------------------------------------------------------------------
/* 1
Describir la tabla floors
*/

desc floors;

/* 2
Describir la tabla spaces
*/
DESC floors;
/* 3
Datos de la tabla components
*/
SELECT *
FROM COMPONENTS;
/* 4
Datos de la tabla component_types
*/
SELECT *
FROM COMPONENT_TYPES;
/* 5
Id, nombre de los facilities
*/

SELECT * 
FROM FLOORS
WHERE FACILITYID=1 AND ID=1;

/* 6
Nombre, elevación e id del facility de las plantas
*/
SELECT name, elevation, facilityid
from FLOORS;
/* 7
Nombre, area bruta, volumen de los espacios
*/
SELECT NAME NOMBRE, GROSSAREA AREABRUTA,VOLUME VOLUMEN
FROM SPACES;
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
SELECT name,modelnumber
from COMPONENT_TYPES
    where id=60;
/* 11
Nombre y fecha de instalación de los componentes del espacio 60 ordenados descendentemente por la fecha de instalación
*/
SELECT NAME NOMBRE, INSTALLATEDON FECHA_DE_INSTALACION
FROM COMPONENTS
WHERE SPACEID=60
ORDER BY INSTALLATEDON DESC;
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

SELECT ID "GUID", TO_CHAR (WARRANTYSTARTON, 'DD-MM-YYYY')"FECHA DE GARANTÍA"
FROM COMPONENTS
WHERE FACILITYID = 1
AND WARRANTYSTARTON IS NOT NULL
ORDER BY TO_CHAR (INSTALLATEDON, 'YYYY-MM-DD') ASC;

/* 14
Id, código de activo, GUID, número de serie y nombre de los componentes cuyo spaceid está entre 10 y 27 inclusive
ordenados por id de espacio descendentemente.
*/
select id,assetidentifier, externalidentifier, serialnumber, name
from COMPONENTS
    where spaceid >=10 and spaceid <=27
    order by spaceid desc;

/* 15
Id, código de activo, GUID, número de serie y nombre de los componentes del facility 1 
ordenados por código de activo descendentemente.
*/
SELECT ID, ASSETIDENTIFIER CODIGO_DE_ACTIVO,EXTERNALIDENTIFIER GUID,SERIALNUMBER NUMERO_DE_SERIE, NAME NOMBRE_DEL_COMPONENTE
FROM COMPONENTS
WHERE FACILITYID = 1
ORDER BY ASSETIDENTIFIER DESC;
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

select distinct
    installatedon
from components
where facilityid = 1
    and spaceid in (10,12,16,19)
order by installatedon desc;

/* 18
Nombre, volumen, de los espacios
cuyo volumen es mayor a 90 de floorid = 1
ordenados por volumen descendentemente
*/
select name,volume, floorid
from SPACES
    where floorid =1 and volume >90
    order by volume desc;
/* 19
Nombre, volumen de los espacios
cuyo volumen es mayor a 6 y menor a 9 de la planta con id = 1
*/
SELECT NAME NOMBRE, VOLUME VOLUMEN
FROM SPACES
WHERE FLOORID=1
AND VOLUME BETWEEN 6 AND 9;
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

select name, assetidentifier, serialnumber
from components
where facilityid = 1 and serialnumber is not null;

/* 22
Nombre de los espacios que empiezan por la letra A donde floorid = 1
*/
select name
from SPACES
    where floorid =1 and name like 'A%';
/* 23
Lista de espacios que su segunda letra es una 's' donde floorid = 1
*/
SELECT NAME NOMBRE
FROM SPACES
WHERE FLOORID=1
AND
NAME LIKE '_s%';
/* 24
Lista de tipos de componente del facility 1 
donde el nombre contiene el texto 'con'
y no tienen vida útil indicada o fecha de garantia 
*/
falta
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
select name, installatedon, warrantystarton
from COMPONENTS
    where facilityid =1 and warrantystarton is not null;
/* 27
Lista de nombres de espacio que su id no es 4, 9, ni 19
del floorid 1
*/
SELECT NAME NOMBRE
FROM SPACES
WHERE ID NOT IN (4,9,19);
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

SELECT NAME "TIPOS DE COMPONENTES"
FROM COMPONENT_TYPES
WHERE FACILITYID = 1
AND warrantydurationparts IS NOT NULL;

/* 30
Lista de los tipos de componentes que no tiene el coste de repuesto
del facility 1
*/
select name
from COMPONENT_TYPES
where replacementcost is null and facilityid =1;
/* 31
Lista de los tipos de componentes que tienen en el nombre un guión bajo
del facility 1
*/
SELECT NAME
FROM COMPONENT_TYPES
WHERE FACILITYID=1 
AND LOWER(NAME) LIKE '%@_%' ESCAPE '@';
--
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
--SELECTS SIMPLES
------------------------------------------------------------------------------------------------
/* 1
Describir la tabla floors
*/
DESC FLOORS;
/* 2
Describir la tabla spaces
*/

/* 3
Datos de la tabla components
*/
SELECT *
    FROM components;

/* 4
Datos de la tabla component_types
*/

/* 5
Id, nombre de los facilities
*/
Select
    name
    Id
from facilities;
/* 6
Nombre, elevación e id del facility de las plantas
*/

/* 7
Nombre, area bruta, volumen de los espacios
*/
SELECT NETAREA,VOLUME
FROM SPACES;
/* 8
Nombre, vida útil de los tipos de componentes del facility 1
*/

/* 9
Nombre de los espacios de la Planta 1 del facility 1
*/
/*Previamente se consulta cuál es el floorid
listando los */
select
    name,floorid
from spaces
where floorid = ( select ID
    From FLOORS
    where
        NAME='Planta 1'
        and facilityId=1);
/* 10
Nombre, número de modelo del tipo de componente con id = 60
*/

/* 11
Nombre y fecha de instalación de los componentes del espacio 60 ordenados descendentemente por la fecha de instalación
*/
SELECT NAME,INSTALLATEDON
FROM COMPONENTS
WHERE SPACEID=60
ORDER BY 2 DESC;
/* 12
Listar las distintas fechas de instalación de los componentes del facility 1 ordenados descendentemente.
*/

/* 13
Listar los distintos GUIDs de los componentes del facility 1 ordenados ascendentemente por fecha de garantía.
*/
select
    externalidentifier,warrantystarton 
From components
where facilityid=1
order by (warrantystarton) asc;
/* 14
Id, código de activo, GUID, número de serie y nombre de los componentes cuyo spaceid está entre 10 y 27 inclusive
ordenados por id de espacio descendentemente.
*/

/* 15
Id, código de activo, GUID, número de serie y nombre de los componentes del facility 1 
ordenados por código de activo descendentemente.
*/
SELECT ID,ASSETIDENTIFIER Código_de_Activo, Externalidentifier GUID, SERIALNUMBER Número_de_Serie, Name Nombre_De_Los_Componentes
FROM COMPONENTS
WHERE facilityid=1
ORDER BY 2 DESC;
/* 16
Códigos de activo de los componentes del espacio con id 21
ordenados por código de activo descendentemente.
*/

/* 17
Las distintas fechas de instalación de los componentes 
de los espacios con id 10, 12, 16, 19 
ordenadas descendentemente.
*/
select
    installatedon
from components
where spaceid= 10 or spaceid=12 or spaceid=16 or spaceid=19;
o 
select
    installatedon
from components
where spaceid in(10,12,16,19);
/* 18
Nombre, volumen, de los espacios
cuyo volumen es mayor a 90 de floorid = 1
ordenados por volumen descendentemente
*/

/* 19
Nombre, volumen de los espacios
cuyo volumen es mayor a 6 y menor a 9 de la planta con id = 1
*/
SELECT NAME, VOLUME
FROM SPACES
WHERE (VOLUME BETWEEN 6 AND 9) AND FLOORID=1;
/* 20
Nombre, código de activo, número de serie de los componentes
que no tengan espacio del facility 1
ordenados descendentemente por código de activo
*/

/* 21
Nombre, código de activo, número de serie de los componentes
que tengan número de serie del facility 1
*/
select
    name,
    assetidentifier,
    serialnumber
from components
where facilityid=1;

/* 22
Nombre de los espacios que empiezan por la letra A donde floorid = 1
*/

/* 23
Lista de espacios que su segunda letra es una 's' donde floorid = 1
*/
SELECT NAME
FROM SPACES
WHERE (NAME LIKE '_s%')AND FLOORID=1;
/* 24
Lista de tipos de componente del facility 1 
donde el nombre contiene el texto 'con'
y no tienen vida útil indicada o fecha de garantia 
*/

/* 25
Nombres de espacios y volumen
pero como volumen una etiqueta que indique 
'BAJO' si es menor a 10, 'ALTO' si es mayor a 1000
y 'MEDIO' si está entre medias
*/
SELECT NAME NOMBRE_DE_ESPACIOS,
CASE
WHEN VOLUME < 10 THEN 'BAJO'
WHEN VOLUME BETWEEN 10 AND 1000 THEN 'MEDIO'
WHEN VOLUME > 1000 THEN 'ALTO'
ELSE 'ERROR'
END VOLUMEN
FROM SPACES 
/* 26
Nombre, fecha de instalación, fecha de garantia
de los componentes del facility 1
que tienen fecha de garantia
*/
select
    name,installatedon,warrantystarton
from components
where warrantystarton is not null;
/* 27
Lista de nombres de espacio que su id no es 4, 9, ni 19
del floorid 1
*/
select 
    name
    id
from spaces
where floorid=1 and id is not in (4,9,19);
/* 28
Lista de espacios que no son Aula del floorid = 1
*/

/* 29
Lista de los tipos de componentes que tienen duracion de la garantia de las partes
del facility 1
*/
SELECT NAME, WARRANTYDURATIONPARTS
FROM component_types
WHERE facilityid=1 AND WARRANTYDURATIONPARTS <> NULL;
/* 30
Lista de los tipos de componentes que no tiene el coste de repuesto
del facility 1
*/

/* 31
Lista de los tipos de componentes que tienen en el nombre un guión bajo
del facility 1
*/
SELECT NAME
FROM component_types
WHERE facilityid=1 AND NAME LIKE '%_%';
--
------------------------------------------------------------------------------------------------

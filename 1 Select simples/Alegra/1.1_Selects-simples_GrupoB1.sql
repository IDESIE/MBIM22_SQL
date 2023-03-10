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
desc spaces;

/* 3
Datos de la tabla components
*/
select* 
    from components;

/* 4
Datos de la tabla component_types
*/
SELECT * FROM COMPONENT_TYPES;

/* 5
Id, nombre de los facilities
*/
SELECT
        NAME
        ID
FROM FACILITIES;

/* 6
Nombre, elevación e id del facility de las plantas
*/
select
    name,elevation, id
from floors;

/* 7
Nombre, area bruta, volumen de los espacios
*/
select
    name "nombre de espacios",
    grossarea "area bruta",
    volume "volumen"
from
    spaces;

/* 8
Nombre, vida útil de los tipos de componentes del facility 1
*/
SELECT NAME "NOMBRE DEL TIPO DE COMPONENTE", EXPECTEDLIFE "VIDA ÚTIL"
FROM COMPONENT_TYPES
WHERE FACILITYID = 1;

/* 9
Nombre de los espacios de la Planta 1 del facility 1
*/
SELECT
        NAME
        FLOORID
FROM SPACES

WHERE
        FLOORID=(SELECT ID
        FROM FLOORS
WHERE 
        NAME='Planta 1'
       AND FACILITYID=1);
/*Previamente se consulta cuál es el floorid
listando los */

/* 10
Nombre, número de modelo del tipo de componente con id = 60
*/
select
    id, name NOMBRE, modelnumber NUMMODELO
from component_types 
where id = 60;

/* 11
Nombre y fecha de instalación de los componentes del espacio 60 ordenados descendentemente por la fecha de instalación
*/
select
    name "nombre",
    installatedon "fecha de instalación" 
from
    components
where
    spaceid = 60 
order by
    installatedon desc;
    
/* 12
Listar las distintas fechas de instalación de los componentes del facility 1 ordenados descendentemente.
*/
SELECT DISTINCT installatedon 
FROM components 
WHERE facilityid = 1 
ORDER BY installatedon DESC;


/* 13
Listar los distintos GUIDs de los componentes del facility 1 ordenados ascendentemente por fecha de garantía.
*/
SELECT
        DISTINCT(EXTERNALIDENTIFIER),
        WARRANTYSTARTON
FROM
        COMPONENTS
WHERE
        FACILITYID=1
ORDER BY
        (WARRANTYSTARTON) ASC;
/* 14
Id, código de activo, GUID, número de serie y nombre de los componentes cuyo spaceid está entre 10 y 27 inclusive
ordenados por id de espacio descendentemente.
*/
select 
    spaceid, id, externalidentifier, assetidentifier, serialnumber, name
from components
where spaceid between 10 and 27
order by spaceid desc;

/* 15
Id, código de activo, GUID, número de serie y nombre de los componentes del facility 1 
ordenados por código de activo descendentemente.
*/
select
    id,
    assetidentifier "codigo de activo",
    externalidentifier "guid",
    serialnumber "numero de serie",
    name "nombre"
from 
    components
where
    facilityid = 1
order by assetidentifier desc;
    
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
SELECT
        DISTINCT(INSTALLATEDON)
FROM
        COMPONENTS
WHERE
        SPACEID IN (10,12,16,19)
ORDER BY
        (INSTALLATEDON) DESC;
/* 18
Nombre, volumen, de los espacios
cuyo volumen es mayor a 90 de floorid = 1
ordenados por volumen descendentemente
*/
select
    floorid, name NOMBRE, volume VOLUMEN
from spaces
where floorid = 1 and volume >90
order by volume desc;

/* 19
Nombre, volumen de los espacios
cuyo volumen es mayor a 6 y menor a 9 de la planta con id = 1
*/
select
    name "nombre",
    volume "volumen"
from
    spaces
where
    volume > 6 and volume < 9 and  floorid = 1;

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
SELECT
        NAME,
        ASSETIDENTIFIER,
        SERIALNUMBER
FROM
        COMPONENTS
WHERE
        FACILITYID=1;
/* 22
Nombre de los espacios que empiezan por la letra A donde floorid = 1
*/

/* 23
Lista de espacios que su segunda letra es una 's' donde floorid = 1
*/
select
    name "nombre"
from
    spaces
where
    floorid = 1
    and name like '_s%';

/* 24
Lista de tipos de componente del facility 1 
donde el nombre contiene el texto 'con'
y no tienen vida útil indicada o fecha de garantia 
*/
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
*/SELECT 
    NAME, 
    VOLUME,
    CASE
        WHEN VOLUME < 10 THEN 'BAJO'
        WHEN VOLUME > 1000 THEN 'ALTO'
        ELSE 'MEDIO'
    END TEXTO
FROM SPACES;

/* 26
Nombre, fecha de instalación, fecha de garantia
de los componentes del facility 1
que tienen fecha de garantia
*/
select
    facilityid, name, installatedon "FECHA DE INSTALACIÓN", warrantystarton "FECHA DE GARANTÍA"
from components
where facilityid = 1 and warrantystarton is not null;

/* 27
Lista de nombres de espacio que su id no es 4, 9, ni 19
del floorid 1
*/
select 
    name "nombre"
from
    spaces
where
    floorid =1 
    and id not in (4,9,19);

/* 28
Lista de espacios que no son Aula del floorid = 1
*/
select 
    name, floorid
from
    spaces
where 
    floorid= 1 and lower(name) not like '%aula%'
order by 1 desc;

/* 29
Lista de los tipos de componentes que tienen duracion de la garantia de las partes
del facility 1
*/
select
    name, warrantydurationparts, facilityid
from component_types
where facilityid01 and warrantydurationparts in not null;

/* 30
Lista de los tipos de componentes que no tiene el coste de repuesto
del facility 1
*/
select
    facilityid, name, replacementcost
from component_types
where replacementcost is null and facilityid = 1;

/* 31
Lista de los tipos de componentes que tienen en el nombre un guión bajo
del facility 1
*/
select
    name "nombre"
from
    component_types
where 
    facilityid = 1
    and name like '%_%';
    
--
------------------------------------------------------------------------------------------------

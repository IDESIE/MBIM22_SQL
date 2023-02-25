------------------------------------------------------------------------------------------------
-- SELECT con subcolsultas y JOINS
------------------------------------------------------------------------------------------------
/*1
Listar de la tabla facilities el id y nombre, 
además de la tabla floors el id, nombre y facilityid
*/

/*2
Lista de id de espacios que no están en la tabla de componentes (spaceid)
pero sí están en la tabla de espacios.
*/ 
Select 
    SPACES.ID
FROM 
    SPACES JOIN COMPONENTS ON COMPONENTS.SPACEID=SPACES.ID;

/*3
Lista de id de tipos de componentes que no están en la tabla de componentes (typeid)
pero sí están en la tabla de component_types
*/


/*4
Mostrar de la tabla floors los campos: name, id;
y de la tabla spaces los campos: floorid, id, name
de los espacios 109, 100, 111
*/


/*5
Mostrar de component_types los campos: material, id;
y de la tabla components los campos: typeid, id, assetidentifier
de los componentes con id 10000, 20000, 300000
*/


/*6
¿Cuál es el nombre de los espacios que tienen cinco componentes?
*/
SELECT 
    SPACES.NAME,
    Count(COMPONENTS.SPACEID)
FROM 
    SPACES JOIN COMPONENTS ON COMPONENTS.SPACEID=SPACES.ID
GROUP BY SPACES.NAME
HAVING Count(COMPONENTS.SPACEID) = 5;

/*7
¿Cuál es el id y assetidentifier de los componentes
que están en el espacio llamado CAJERO?
*/


/*8
¿Cuántos componentes
hay en el espacio llamado CAJERO?
*/


/*9
Mostrar de la tabla spaces: name, id;
y de la tabla components: spaceid, id, assetidentifier
de los componentes con id 10000, 20000, 30000
aunque no tengan datos de espacio.
*/


/*
10
Listar el nombre de los espacios y su área del facility 1
*/

SELECT 
    SPACES.NAME,
    spaces.netarea
FROM 
    SPACES JOIN FLOORS ON SPACES.FLOORID =FLOORS.ID
WHERE FACILITYID=1;
/*11
¿Cuál es el número de componentes por facility?
Mostrar nombre del facility y el número de componentes.
*/


/*12
¿Cuál es la suma de áreas de los espacios por cada facility?
Mostrar nombre del facility y la suma de las áreas 
*/


/*13
¿Cuántas sillas hay de cada tipo?
Mostrar el nombre del facility, el nombre del tipo
y el número de componentes de cada tipo
ordernado por facility.
*/


--Ejemplo
--Alegra	Silla-Apilable_Silla-Apilable	319
--Alegra	Silla-Brazo escritorio_Silla-Brazo escritorio	24
--Alegra	Silla (3)_Silla (3)	24
--Alegra	Silla-Corbu_Silla-Corbu	20
--Alegra	Silla-Oficina (brazos)_Silla-Oficina (brazos)	17
--COSTCO	Silla-Apilable_Silla-Apilable	169
--COSTCO	Silla_Silla	40
--COSTCO	Silla-Corbu_Silla-Corbu	14
--COSTCO	Silla-Oficina (brazos)_Silla-Oficina (brazos)	188

/*
14
Listar nombre, código de asset, número de serie, el año de instalación, nombre del espacio,
de todos los componentes
del facility 1
que estén en un aula y no sean tuberias, muros, techos, suelos.
*/

SELECT
    COMPONENTS.NAME,
    COMPONENTS.ASSETIDENTIFIER,
    COMPONENTS.SERIALNUMBER,
    TO_CHAR(COMPONENTS.INSTALLATEDON),
    SPACES.NAME,
    COMPONENTS.FACILITYID
FROM 
    COMPONENTS JOIN SPACES ON COMPONENTS.SPACEID = SPACES.ID
WHERE UPPER(SPACES.NAME) LIKE '%AULA%' 
AND 
(UPPER(COMPONENTS.NAME) 
NOT LIKE ('%TUBERIA%') OR UPPER(COMPONENTS.NAME) 
NOT LIKE '%MURO%' OR UPPER(COMPONENTS.NAME) 
NOT LIKE '%TECHO%' OR UPPER(COMPONENTS.NAME) 
NOT LIKE '%SUELO%'); 
/*
15
Nombre, área bruta y volumen de los espacios con mayor área que la media de áreas del facility 1.
*/


/*
16
Nombre y fecha de instalación (yyyy-mm-dd) de los componentes del espacio con mayor área del facility 1
*/


/*
17
Nombre y código de activo  de los componentes cuyo tipo de componente contenga la palabra 'mesa'
del facility 1
*/


/*
18
Nombre del componente, espacio y planta de los componentes
de los espacios que sean Aula del facility 1
*/
SELECT  
    COMPONENTS.NAME COMPONENTE,
    SPACES.NAME ESPACIO, 
    FLOORS.NAME PLANTA
FROM COMPONENTS
    JOIN SPACES ON COMPONENTS.SPACEID = SPACES.ID
    JOIN FLOORS ON SPACES.FLOORID = FLOORS.ID
WHERE FLOORS.FACILITYID=1;

/*
19
Número de componentes y número de espacios por planta (nombre) del facility 1. 
Todas las plantas.
*/


/*
20
Número de componentes por tipo de componente en cada espacio
de los componentes que sean mesas del facility 1
ordenados de forma ascendente por el espacio y descentente por el número de componentes.
Ejmplo:
Componentes    Tipo   Espacio
--------------------------------
12  Mesa-cristal-redonda    Aula 2
23  Mesa-4x-reclinable      Aula 3
1   Mesa-profesor           Aula 3
21  Mesa-cristal-redonda    Aula 12
*/


/*
21
Mostrar el nombre de las Aulas y una etiqueda «Sillas» que indique
'BAJO' si el número de sillas es menor a 6
'ALTO' si el número de sillas es mayor a 15
'MEDIO' si está entre 6 y 15 inclusive
del facility 1
ordenado ascendentemente por el espacio
Ejemplo:
Espacio Sillas
--------------
Aula 1  BAJO
Aula 2  BAJO
Aula 3  MEDIO
*/



/*
22
Tomando en cuenta los cuatro primeros caracteres del nombre de los espacios
del facility 1
listar los que se repiten e indicar el número.
En orden descendente por el número de ocurrencias.
Ejemplo:
Espacio Ocurrencias
Aula    18
Aseo    4
Hall    2
*/
SELECT 
    SUBSTR(SPACES.NAME,1,4) Espacio,
    COUNT(*) Ocurrencia
FROM SPACES JOIN FLOORS ON SPACES.FLOORID = FLOORS.ID
WHERE FACILITYID=1
GROUP BY SUBSTR(SPACES.NAME,1,4);

/*
23
Nombre y área del espacio que mayor área bruta tiene del facility 1.
*/


/*
24
Número de componentes instalados entre el 1 de mayo de 2010 y 31 de agosto de 2010
y que sean grifos, lavabos del facility 1
*/


/*
25
Un listado en el que se indique en líneas separadas
una etiqueta que describa el valor, y el valor:
el número de componentes en Aula 03 del facility 1, 
el número de sillas en Aula 03 del facility 1
el número de mesas o escritorios en Aula 03 del facility 1
Ejemplo:
Componentes 70
Sillas 16
Mesas 3
*/


/*
26
Nombre del espacio, y número de grifos del espacio con más grifos del facility 1.
*/
SELECT 
    spaces.name Nombre_Espacio,
    COUNT(*) Grifos
    
FROM SPACES JOIN COMPONENTS ON COMPONENTS.SPACEID = SPACES.ID
WHERE FACILITYID=1
having 
Count(*)=(select max(count(*)) from SPACES  JOIN COMPONENTS ON COMPONENTS.SPACEID = SPACES.ID
group by spaces.name)
GROUP BY spaces.name;

/*
27
Cuál es el mes en el que más componentes se instalaron del facility 1.
*/


/* 28
Nombre del día en el que más componentes se instalaron del facility 1.
Ejemplo: Jueves
*/

/*29
Listar los nombres de componentes que están fuera de garantía del facility 1.
*/

/*
30
Listar el nombre de los tres espacios con mayor área del facility 1
*/

------------------------------------------------------------------------------------------------

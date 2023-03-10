------------------------------------------------------------------------------------------------
-- DML
------------------------------------------------------------------------------------------------
/* 1
Insertar un componente en el facility 1 
con nombre «Grifo | Grifo | 030303» 
descripcion «test insert»
número de serie «666333-eeefff»
fecha de instalación «2021-12-12»
inicio de garantia «2021-11-11»
código de activo «666000»
id del creador «3»
id del espacio «7»
id de tipo «78»
guid «666000»
*/
INSERT INTO components(
    FACILITYID,
    NAME,
    DESCRIPTION,
    SERIALNUMBER,
    CREATEDAT,
    WARRANTYSTARTON,
    ASSETIDENTIFIER,
    CREATORID,
    SPACEID,
    TYPEID,
    EXTERNALIDENTIFIER
    )
    VALUES (
    1,
    'Grifo | Grifo | 030303',
    'test insert',
    '666333-eeefff',
    to_date('2021-12-12','yyyy-mm-dd'),
    to_date('2021-11-11','yyyy-mm-dd'),
    '666000',
    3,
    7,
    78,
    '666000'
    );

/*
Comprobar que se ven los datos insertados de forma conjunta con una JOIN
y no de forma independiente. Con el fin de comprobar las relaciones.
Mostrar todos los datos indicados en el punto anterior 
y además el nombre del espacio, nombre de la planta, nombre del tipo de componente
*/

/* 2
Eliminar el componente creado.
*/
DELETE 
    FROM components
    WHERE 
    EXTERNALIDENTIFIER = '666000';
/* 3
Colocar como código de barras los 6 últimos caracteres del GUID 
a todo componente de la planta 1 y 2 del facility 1.
*/

update components
set barcode = substr(externalidentifier,-6)
where facilityid = 1
and spaceid in (select id
                from spaces
                where floorid in (1,2)
                );

/* 4
Modificar la fecha de garantia para que sea igual a la fecha de instalación
para todo componente que sea un grifo o lavabo del facility 1.
*/

Alter Table cb_components
Modify warrantystarton = installatedon
where facilityid=1
and (lower(name) is like 'grifo'
    or lower(name) is like 'lavado');

/* 5
Anonimizar los datos personales: nombre, apellido, email, teléfono de los contactos
*/

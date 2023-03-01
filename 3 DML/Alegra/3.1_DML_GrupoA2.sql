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

insert into cb_components(componentid,facilityid,name,description,serialnumber,assetidentifier,createdby,spaceid,typeid,externalidentifier,installatedon,warrantystarton)
values(3,1,'Grifo | Grifo | 030303','test insert','666333-eeefff','666000','3',1,1,'eee-fff',to_date('2021-12-12','yyyy-mm-dd'),to_date('2021-11-11','yyyy-mm-dd'));

/*
Comprobar que se ven los datos insertados de forma conjunta con una JOIN
y no de forma independiente. Con el fin de comprobar las relaciones.
Mostrar todos los datos indicados en el punto anterior 
y además el nombre del espacio, nombre de la planta, nombre del tipo de componente
*/

select
    cb_spaces.name,
    cb_floors.name,
    cb_components.name
from cb_spaces
join cb_components on cb_components.spaceid = cb_spaces.spaceid
join cb_floors on cb_floors.floorid = cb_spaces.spaceid;

/* 2
Eliminar el componente creado.
*/

rollback

/* 3
Colocar como código de barras los 6 últimos caracteres del GUID 
a todo componente de la planta 1 y 2 del facility 1.
*/

/* 4
Modificar la fecha de garantia para que sea igual a la fecha de instalación
para todo componente que sea un grifo o lavabo del facility 1.
*/

/* 5
Anonimizar los datos personales: nombre, apellido, email, teléfono de los contactos
*/

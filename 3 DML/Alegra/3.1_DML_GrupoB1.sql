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
insert into cb_components
    (facilityid,componentid,externalidentifier, name, description, serialnumber, installatedon, replacedon, 
    warrantystarton, createdby, spaceid, typeid,assetidentifier,updatedby,createdon,updatedon),
values
(1,6,9,'Grifo_Grifo_030303',test insert,666333_eeefff,'2021_12_12',2021_11_11,666000,3,7,78,'666000',2abc,3,5)

/*
Comprobar que se ven los datos insertados de forma conjunta con una JOIN
y no de forma independiente. Con el fin de comprobar las relaciones.
Mostrar todos los datos indicados en el punto anterior 
y además el nombre del espacio, nombre de la planta, nombre del tipo de componente
*/
select 
    spaces.name, floors.name, component_types.name
    spaces.floorid, floors.id,spaces.id,components.spaceid,components.typeid,component_types.id,
        from components
            join component_types on component_types.id = components.typeid
            join spaces on components.spaceid = spaces.id
            join floors on floors.id = spaces.floorid ;
/* 2
Eliminar el componente creado.
*/
drop component;
/* 3
Colocar como código de barras los 6 últimos caracteres del GUID 
a todo componente de la planta 1 y 2 del facility 1.
*/
update components
    set 
where
    facilityid= 1

/* 4
Modificar la fecha de garantia para que sea igual a la fecha de instalación
para todo componente que sea un grifo o lavabo del facility 1.
*/

/* 5
Anonimizar los datos personales: nombre, apellido, email, teléfono de los contactos
*/

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
INSERT INTO CB_COMPONENT_TYPES (TYPEID,NAME,CREATEDBY,CREATEDON) VALUES ('78','GRIFO','3',SYSDATE);
INSERT INTO CB_FACILITIES (FACILITYID,NAME,CREATEDBY,CREATEDON) VALUES ('1','CASA BURDA','3',SYSDATE);
INSERT INTO CB_FLOORS (FLOORID,NAME,FACILITYID,CREATEDBY,CREATEDON) VALUES ('1','PLANTA BAJA','1','3',SYSDATE);
INSERT INTO CB_SPACES (SPACEID,NAME,FLOORID,CREATEDBY,CREATEDON) VALUES ('7','COCINA','1','3',SYSDATE);
Insert into CB_COMPONENTS 
(componentid,NAME,DESCRIPTION,EXTERNALIDENTIFIER,SERIALNUMBER,INSTALLATEDON,WARRANTYSTARTON,ASSETIDENTIFIER,SPACEID,TYPEID,REPLACEDON,FACILITYID,CREATEDBY,UPDATEDBY,CREATEDON,UPDATEDON) 
VALUES 
('1','Grifo|Grifo|030303','Test insert','666000','666333-eeefff',to_timestamp('2021-12-12','yyyy-mm-dd'),to_timestamp('2021-11-11','YYYY-MM-DD'),'666000','7','78',NULL,'1','3',NULL,SYSDATE,NULL); 

/*
Comprobar que se ven los datos insertados de forma conjunta con una JOIN
y no de forma independiente. Con el fin de comprobar las relaciones.
Mostrar todos los datos indicados en el punto anterior 
y además el nombre del espacio, nombre de la planta, nombre del tipo de componente
*/
SELECT 
    CB_COMPONENTS.FACILITYID FACILITY,
    CB_COMPONENTS.NAME NOMBRE,
    CB_COMPONENTS.DESCRIPTION DESCRIPCIÓN,
    CB_COMPONENTS.SERIALNUMBER NUMERO_DE_SERIE,
    CB_COMPONENTS.installatedon FECHA_INSTALACIÓN,
    CB_COMPONENTS.WARRANTYSTARTON FECHA_GARANTÍA,
    CB_COMPONENTS.ASSETIDENTIFIER CÓDIGO_ACTIVO,
    CB_COMPONENTS.CREATEDBY ID_CREADOR,
    CB_COMPONENTS.SPACEID ID_ESPACIO,
    CB_COMPONENTS.TYPEID ID_TIPO,
    CB_COMPONENTS.EXTERNALIDENTIFIER GUID,
    CB_SPACES.NAME NOMBRE_ESPACIO,
    CB_FLOORS.NAME NOMBRE_PLANTA,
    CB_COMPONENT_TYPES.NAME NOMBRE_TIPO_COMPONENTE
FROM CB_COMPONENTS 
    JOIN CB_SPACES ON CB_COMPONENTS.SPACEID = CB_SPACES.SPACEID
    JOIN CB_FLOORS ON CB_SPACES.FLOORID = CB_FLOORS.FLOORID
    JOIN CB_COMPONENT_TYPES ON CB_COMPONENTS.TYPEID = CB_COMPONENT_TYPES.TYPEID;
/* 2
Eliminar el componente creado.
*/
DELETE FROM CB_COMPONENTS WHERE FACILITYID = 1;
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

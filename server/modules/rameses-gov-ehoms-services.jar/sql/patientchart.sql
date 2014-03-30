[getList]
SELECT pc.*, 
p.lastname AS patient_lastname, 
p.firstname AS patient_firstname, 
u.lastname AS physician_lastname,  
u.firstname AS physician_firstname
FROM patientchart pc 
INNER JOIN patient p ON pc.patient_objid=p.objid
INNER JOIN sys_user u ON pc.attendingphysician_objid=u.objid

[getList]
SELECT pa.*,a.title 
FROM patientchart_activity pa
INNER JOIN activity a ON pa.activity_objid=a.objid
WHERE pa.parentid=$P{objid}

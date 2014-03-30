[getLookup]
SELECT u.objid, u.username, u.lastname, u.firstname, u.jobtitle, ugm.usergroup_objid, ug.role, ug.domain
FROM sys_user u 
INNER JOIN sys_usergroup_member ugm ON u.objid=ugm.user_objid
INNER JOIN sys_usergroup ug ON ug.objid=ugm.usergroup_objid
WHERE ug.role = 'RESIDENT_PHYSICIAN'

[findById]
SELECT * FROM sys_user WHERE objid=$P{objid}

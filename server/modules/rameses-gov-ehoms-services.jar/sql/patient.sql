[getList]
SELECT b.* FROM 
(
	SELECT * FROM patient WHERE lastname LIKE $P{searchtext} 
	UNION 
	SELECT * FROM patient WHERE firstname LIKE $P{searchtext} 
	UNION 
	SELECT * FROM patient WHERE acctid LIKE $P{searchtext} 
) b

[getLookup]
SELECT b.* FROM 
(
	SELECT * FROM patient WHERE lastname LIKE $P{searchtext} 
	UNION 
	SELECT * FROM patient WHERE firstname LIKE $P{searchtext} 
	UNION 
	SELECT * FROM patient WHERE acctid LIKE $P{searchtext} 
) b

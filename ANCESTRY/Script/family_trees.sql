--SELECT * FROM ANCESTRY.person

--update ANCESTRY.person set person_code='PERKI904098ZH' where id=60
--update ANCESTRY.person set bio_mother_id=2 where id=44

--select * from ANCESTRY.vw_person_attribute_pivot where person_code NOT LIKE '%XX' order by 2
/*
DECLARE @PersonId INT = 133;

;WITH FamilyTree AS
(
	-- Starting person
	SELECT
		p.id,
		p.person_code,
		p.bio_father_id,
		p.bio_mother_id,
		0 AS lvl,
		CAST(p.person_code AS varchar(MAX)) AS tree_path
	FROM ANCESTRY.person p
	WHERE p.id = @PersonId

	UNION ALL

	-- Parent recursion
	SELECT
		pp.id,
		pp.person_code,
		pp.bio_father_id,
		pp.bio_mother_id,
		ft.lvl + 1,
		ft.tree_path + '/' + rel.rel
	FROM FamilyTree ft
	CROSS APPLY (
		VALUES
			(ft.bio_father_id, 'F'),
			(ft.bio_mother_id, 'M')
	) rel(parent_id, rel)
	JOIN ANCESTRY.person pp
		ON pp.id = rel.parent_id where pp.id NOT IN (1,2)
)
SELECT
--    REPLICATE('    ', lvl) + tr.person_code AS TreeNode,
	REPLICATE('    ', lvl) + ap.first_name + ' ' + ap.surname AS TreeNode,
	tr.id,
	tr.lvl,
	tr.tree_path
FROM FamilyTree tr
INNER JOIN ANCESTRY.vw_person_attribute_pivot ap 
ON tr.id = ap.id
ORDER BY tree_path
OPTION (MAXRECURSION 100);
*/
/*
DECLARE @PersonId INT = 46;

;WITH FamilyTree AS
(
	SELECT
		p.id,
		p.person_code,
		p.bio_father_id,
		p.bio_mother_id,
		0 AS lvl,
		cast(CONCAT('|', p.id, '|') as varchar(max)) AS visited
	FROM ANCESTRY.person p
	WHERE p.id in (59,60)

	UNION ALL

	SELECT
		pp.id,
		pp.person_code,
		pp.bio_father_id,
		pp.bio_mother_id,
		ft.lvl + 1,
		ft.visited + CAST(pp.id AS varchar(max)) + '|'
	FROM FamilyTree ft
	CROSS APPLY
	(
		VALUES
			(ft.bio_father_id),
			(ft.bio_mother_id)
	) rel(parent_id)
	JOIN ANCESTRY.person pp
		ON pp.id = rel.parent_id
	WHERE ft.visited NOT LIKE '%|' + CAST(pp.id AS varchar(max)) + '|%' and pp.id not in (1, 2)
)
SELECT *
FROM FamilyTree
where bio_father_id != 1
order by visited
OPTION (MAXRECURSION 0);
*/
DECLARE @person_id int = 122;

;WITH Descendants AS
(
    -- Starting person
    SELECT
        p.id,
        p.person_code,
        p.bio_father_id,
        p.bio_mother_id,
        0 AS lvl
    FROM ANCESTRY.person p
    WHERE p.id = @person_id

    UNION ALL

    -- Children
    SELECT
        c.id,
        c.person_code,
        c.bio_father_id,
        c.bio_mother_id,
        d.lvl + 1
    FROM Descendants d
    JOIN ANCESTRY.person c
        ON c.bio_father_id = d.id
        OR c.bio_mother_id = d.id
)
SELECT *
FROM Descendants
ORDER BY lvl, person_code
OPTION (MAXRECURSION 0);

/*
SELECT
--    REPLICATE('    ', lvl) + tr.person_code AS TreeNode,
	REPLICATE('    ', lvl) + ap.first_name + ' ' + ap.surname AS TreeNode,
	tr.id,
	tr.lvl,
	tr.tree_path
FROM FamilyTree tr
INNER JOIN ANCESTRY.vw_person_attribute_pivot ap 
ON tr.id = ap.id
ORDER BY tree_path
OPTION (MAXRECURSION 100);
*/
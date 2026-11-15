USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'ANCESTRY.vw_person_attribute_all') AND [type] IN ('V'))
BEGIN 
	DROP VIEW ANCESTRY.vw_person_attribute_all
	PRINT '########## ANCESTRY.vw_person_attribute_all dropped successfully ##########'
END
GO

CREATE VIEW ANCESTRY.vw_person_attribute_all AS

	WITH w_union AS (
		SELECT
			s.person_id,
			s.attr_id,
			s.attr_value
		FROM
			ANCESTRY.person_attribute_string s
		WHERE
			s.valid_to = '9999-12-31 23:59:59'
		UNION
		SELECT
			i.person_id,
			i.attr_id,
			CONVERT(varchar(255), i.attr_value) AS attr_value
		FROM
			ANCESTRY.person_attribute_int i
		WHERE
			i.valid_to = '9999-12-31 23:59:59'
		UNION
		SELECT
			d.person_id,
			d.attr_id,
			CONVERT(varchar(255), d.attr_value) AS attr_value
		FROM
			ANCESTRY.person_attribute_date d
		WHERE
			d.valid_to = '9999-12-31 23:59:59'
	)
	SELECT
		p.*,
		pa.attr_type,
		w.*
	FROM
		ANCESTRY.person p
		INNER JOIN w_union w
			INNER JOIN ANCESTRY.person_attribute pa
			ON w.attr_id = pa.id
		ON p.id = w.person_id
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'Base view returning all person attributes converted to varchar(255).',
    @level0type = 'SCHEMA', @level0name = N'ANCESTRY',
    @level1type = 'VIEW', @level1name = 'vw_person_attribute_all';
GO

PRINT '########## ANCESTRY.vw_person_attribute_all created successfully ##########'
USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'ANCESTRY.vw_person_attribute_pivot') AND [type] IN ('V'))
BEGIN 
	DROP VIEW ANCESTRY.vw_person_attribute_pivot
	PRINT '########## ANCESTRY.vw_person_attribute_pivot dropped successfully ##########'
END
GO

CREATE VIEW ANCESTRY.vw_person_attribute_pivot AS

	SELECT
		piv.* 
	FROM 
		(
			SELECT
                p.*,
                pa.attr_desc,
                aa.attr_value
			FROM 
				ANCESTRY.person p
				INNER JOIN ANCESTRY.vw_person_attribute_all aa
                    INNER JOIN ANCESTRY.person_attribute pa
                    ON aa.attr_id = pa.id
				ON p.id = aa.person_id
			) d
		PIVOT
		(
			MAX(attr_value)
			FOR d.attr_desc IN (first_name, middle_name, surname, gender, date_of_birth, date_of_death, place_of_birth, place_of_death)
		) piv

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'Base view returning all person attributes converted to varchar(255).',
    @level0type = 'SCHEMA', @level0name = N'ANCESTRY',
    @level1type = 'VIEW', @level1name = 'vw_person_attribute_pivot';
GO

PRINT '########## ANCESTRY.vw_person_attribute_pivot created successfully ##########'
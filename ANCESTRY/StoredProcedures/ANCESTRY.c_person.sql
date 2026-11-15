USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'ANCESTRY.c_person') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE ANCESTRY.c_person
	PRINT '########## ANCESTRY.c_person dropped successfully ##########'
END
GO

CREATE PROCEDURE ANCESTRY.c_person
	@p_input_json		COMMON.json,
	@p_debug			bit = 0,
	@p_execute			bit = 1

AS
BEGIN

	SET NOCOUNT ON

	DECLARE @insert	TABLE (
		person_code			COMMON.person_code,
		father_code			COMMON.person_code,
		mother_code			COMMON.person_code,
		adopt_father_code	COMMON.person_code NULL,
		adopt_mother_code	COMMON.person_code NULL,
		first_name			varchar(255),
		middle_name			varchar(255),
		surname				varchar(255),
		gender				varchar(255),
		date_of_birth		date,
		date_of_death		date,
		place_of_birth		varchar(255),
		place_of_death		varchar(255)
	)
	DECLARE @output TABLE (
		person_code     COMMON.person_code,
		id              int
	)

	BEGIN TRY
		INSERT INTO @insert
		SELECT 
			p.*
		FROM OPENJSON(@p_input_json, '$.person')
		WITH
		(
			person_code			COMMON.person_code,
			father_code			COMMON.person_code,
			mother_code			COMMON.person_code,
			adopt_father_code	COMMON.person_code,
			adopt_mother_code	COMMON.person_code,
			first_name			varchar(255),
			middle_name			varchar(255),
			surname				varchar(255),
			gender				varchar(255),
			date_of_birth		date,
			date_of_death		date,
			place_of_birth		varchar(255),
			place_of_death		varchar(255)
		) p

		IF EXISTS (
			SELECT 
				1
			FROM 
				@insert i 
				INNER JOIN ANCESTRY.person p
				ON i.person_code = p.person_code
		)
			RAISERROR ('Person codes found that already exist in target database - operation failed.', 16, 1);

		IF EXISTS (
			SELECT
				1
			FROM (
				SELECT DISTINCT father_code AS person_code FROM @insert
				UNION
				SELECT DISTINCT mother_code AS person_code FROM @insert
				UNION
				SELECT DISTINCT adopt_father_code AS person_code FROM @insert WHERE adopt_father_code IS NOT NULL
				UNION
				SELECT DISTINCT adopt_mother_code AS person_code FROM @insert WHERE adopt_father_code IS NOT NULL
			) w
				LEFT OUTER JOIN ANCESTRY.person p
				ON w.person_code = p.person_code
			WHERE
				p.person_code IS NULL
		)
			RAISERROR ('father / mother codes found that do not exist in target database - operation failed.', 16, 1)

		BEGIN TRANSACTION

        INSERT INTO ANCESTRY.person(person_code, bio_father_id, bio_mother_id, adopt_father_id, adopt_mother_id)
		OUTPUT inserted.person_code, inserted.id INTO @output
		SELECT DISTINCT 
			i.person_code,
			f.id,
			m.id,
			af.id,
			am.id
		FROM 
			@insert i
			INNER JOIN ANCESTRY.person f
			ON i.father_code = f.person_code
			INNER JOIN ANCESTRY.person m
			ON i.mother_code = m.person_code
			LEFT OUTER JOIN ANCESTRY.person af
			ON i.adopt_father_code = af.person_code
			LEFT OUTER JOIN ANCESTRY.person am
			ON i.adopt_mother_code = am.person_code;

		WITH w_string AS (
			SELECT i.person_code, 'first_name' AS attr_desc, i.first_name AS attr_value FROM @insert i
			UNION
			SELECT i.person_code, 'middle_name' AS attr_desc, i.middle_name AS attr_value FROM @insert i
			UNION
			SELECT i.person_code, 'surname' AS attr_desc, i.surname AS attr_value FROM @insert i
			UNION
			SELECT i.person_code, 'gender' AS attr_desc, i.gender AS attr_value FROM @insert i
			UNION
			SELECT i.person_code, 'place_of_birth' AS attr_desc, i.place_of_birth AS attr_value FROM @insert i
			UNION
			SELECT i.person_code, 'place_of_death' AS attr_desc, i.place_of_death AS attr_value FROM @insert i
		)
		INSERT INTO ANCESTRY.person_attribute_string(attr_id, person_id, attr_value)
		SELECT
			a.id,
			o.id,
			w.attr_value
		FROM
			w_string w
			INNER JOIN @output o
			ON w.person_code = o.person_code
			INNER JOIN ANCESTRY.person_attribute a
			ON w.attr_desc = a.attr_desc
		WHERE
			w.attr_value IS NOT NULL;

		WITH w_date AS (
			SELECT i.person_code, 'date_of_birth' AS attr_desc, i.date_of_birth AS attr_value FROM @insert i
			UNION
			SELECT i.person_code, 'date_of_death' AS attr_desc, i.date_of_death AS attr_value FROM @insert i
		)
		INSERT INTO ANCESTRY.person_attribute_date(attr_id, person_id, attr_value)
		SELECT
			a.id,
			o.id,
			w.attr_value
		FROM
			w_date w
			INNER JOIN @output o
			ON w.person_code = o.person_code
			INNER JOIN ANCESTRY.person_attribute a
			ON w.attr_desc = a.attr_desc
		WHERE
			w.attr_value IS NOT NULL;

		IF @p_execute = 1
		BEGIN
			COMMIT TRANSACTION
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
			PRINT 'Transaction rolled back - no changes made'
		END

	END TRY

	BEGIN CATCH  
		DECLARE @error_message varchar(4000)
		DECLARE @error_severity int  
		DECLARE @error_state int
	
		-- IF @@TRANCOUNT != 0			-- Not required here but retain for completeness
		-- 	ROLLBACK TRANSACTION

		SELECT   
			@error_message = ERROR_MESSAGE(),  
			@error_severity = ERROR_SEVERITY(),  
			@error_state = ERROR_STATE();  

		RAISERROR (@error_message,
				@error_severity,
				@error_state
				)
	END CATCH

END
GO
PRINT '########## ANCESTRY.c_person created successfully ##########'

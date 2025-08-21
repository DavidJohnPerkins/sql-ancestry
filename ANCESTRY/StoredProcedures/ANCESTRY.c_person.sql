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

	DECLARE @insert		COMMON.person_list
	
	BEGIN TRY
	
		INSERT INTO @insert 
		SELECT
			p.person_code,
			a.attr_name ,
			a.attr_value
		FROM OPENJSON (@p_input_json)
		WITH
		(
			person COMMON.json AS json
		) c
		CROSS APPLY OPENJSON (c.person)
		WITH
		(
			person_code			COMMON.person_code,
			person_attribute	COMMON.json AS json
		) p
		CROSS APPLY OPENJSON (p.person_attribute)
		WITH
		(
			attr_name varchar(255),
			attr_value varchar(255)
		) a

		IF @p_debug = 1
		BEGIN
			SELECT 'COLLECTION.c_collection_item 1', i.* from @insert i
		END

		SELECT * FROM @insert
		--EXEC CORE.c_collection_item @insert, @p_debug, @p_execute

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

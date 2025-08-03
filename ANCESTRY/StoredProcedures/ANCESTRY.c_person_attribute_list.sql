USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'ANCESTRY.c_person_attribute_list') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE ANCESTRY.c_person_attribute_list
	PRINT '########## ANCESTRY.c_person_attribute_list dropped successfully ##########'
END
GO

CREATE PROCEDURE ANCESTRY.c_person_attribute_list
	@p_input_json		COMMON.json,
	@p_debug			bit = 0,
	@p_execute			bit = 1

AS
BEGIN

	SET NOCOUNT ON

	DECLARE @v_update_type		varchar(10),
			@v_attr_list		ANCESTRY.master_attribute_add_list

	BEGIN TRY

		SET @v_update_type = (SELECT JSON_VALUE(@p_input_json, '$."update_type"'))
		INSERT INTO @v_attr_list(attr_type, attr_desc)
		SELECT
			a.attr_type,
			a.attr_desc
		FROM 
			OPENJSON (@p_input_json, '$.attr_list')
			WITH
			(
				attr_type	int,
				attr_desc	varchar(255)
			) a

	EXEC COMMON.c_person_attribute_list @v_attr_list, @v_update_type

	END TRY

	BEGIN CATCH  
		DECLARE @error_message varchar(4000)
		DECLARE @error_severity int  
		DECLARE @error_state int
	
		 IF @@TRANCOUNT != 0
		 	ROLLBACK TRANSACTION

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
PRINT '########## ANCESTRY.c_person_attribute_list created successfully ##########'

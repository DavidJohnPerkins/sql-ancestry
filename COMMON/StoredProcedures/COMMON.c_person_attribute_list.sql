USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COMMON.c_person_attribute_list') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COMMON.c_person_attribute_list
	PRINT '########## COMMON.c_person_attribute_list dropped successfully ##########'
END
GO

CREATE PROCEDURE COMMON.c_person_attribute_list
	@p_attr_list		ANCESTRY.master_attribute_add_list READONLY,
	@p_update_type		varchar(10),
	@p_debug			bit = 0,
	@p_execute			bit = 1

AS
BEGIN

	SET NOCOUNT ON
	
	IF @p_update_type NOT IN ('CREATE', 'REPLACE')
   		RAISERROR ('Update type must be CREATE or REPLACE - operation failed.', 16, 1)

	IF 	EXISTS (SELECT t.attr_type FROM @p_attr_list t EXCEPT SELECT m.attr_type FROM ANCESTRY.person_attribute_type m)
		RAISERROR ('There are invalid attribute types in the input data - operation failed.', 16, 1)

	BEGIN TRY

		BEGIN TRANSACTION

		IF @p_update_type = 'REPLACE'
			DELETE 
				t
			FROM 
				ANCESTRY.person_attribute t

		INSERT INTO ANCESTRY.person_attribute(attr_type, attr_desc)
		SELECT
			al.attr_type,
			al.attr_desc
		FROM
			@p_attr_list al
			LEFT OUTER JOIN ANCESTRY.person_attribute pa
			ON al.attr_type = pa.attr_type
		WHERE 
			pa.id IS NULL

		IF @p_debug = 1
			PRINT 'ATTRIBUTE INSERTIONS COMPLETE'

		IF @p_execute = 1
		BEGIN
			COMMIT TRANSACTION
			PRINT 'ATTRIBUTE COMMIT COMPLETE'
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
			PRINT 'Attribute transaction rolled back - no changes made'
		END

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
PRINT '########## COMMON.c_person_attribute_list created successfully ##########'

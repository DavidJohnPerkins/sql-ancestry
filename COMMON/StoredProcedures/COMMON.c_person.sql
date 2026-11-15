USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COMMON.c_person') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COMMON.c_person
	PRINT '########## COMMON.c_person dropped successfully ##########'
END
GO

CREATE PROCEDURE COMMON.c_person
	@p_insert 			CORE.item_list READONLY ,
	@p_debug			bit = 0,
	@p_execute			bit = 1
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @parent_coll_id		int,
			@parent_coll_name	varchar(50),
--			@parent_id 			int,
			@keyed_coll			bit = 0;

	DECLARE @check_keys TABLE (
		item_key_value	varchar(20),
		item_attr_id	int
	)

	DECLARE @insert_keys TABLE (
		item_key_value	varchar(20),
		parent_id		int
	)

	BEGIN TRY

		SET @parent_coll_name = (SELECT TOP 1 parent_item FROM @p_insert)
		SET @parent_coll_id = ISNULL(COLLECTION.collection_id(@parent_coll_name), 0)

		IF @parent_coll_id = 0 
			RAISERROR ('Collection %s does not exist - operation failed.', 16, 1, @parent_coll_name)

		IF EXISTS (
			SELECT 
				1
			FROM 
				@p_insert i 
				LEFT OUTER JOIN COLLECTION.item_attribute_field iaf
				ON i.attr_name = iaf.item_attr_name
			WHERE 
				iaf.item_attr_name IS NULL
		)
			RAISERROR ('Attributes found that are not defined in target database - operation failed.', 16, 1)

		IF (SELECT b.KEYED_COLLECTION FROM COLLECTION.v_base b WHERE [NAME] = @parent_coll_name) = 'Y'
			SET @keyed_coll = 1

		IF @keyed_coll = 0 AND EXISTS (SELECT 1 FROM @p_insert i WHERE i.attr_name = 'KEY_VALUE')
			RAISERROR ('KEY_VALUE attributes found for non-keyed collection - operation failed.', 16, 1)

		IF @keyed_coll = 1 
		BEGIN 

			IF NOT EXISTS (SELECT 1 FROM @p_insert i WHERE i.attr_name = 'KEY_VALUE')
				RAISERROR ('KEY_VALUE attributes missing for keyed collection - operation failed.', 16, 1)

			INSERT INTO @check_keys
			SELECT DISTINCT 
				i.attr_value,
				iaf.item_attr_id
			FROM
				@p_insert i
				INNER JOIN COLLECTION.item_attribute_field iaf 
				ON i.attr_name = iaf.item_attr_name
			WHERE 
				i.attr_name = 'KEY_VALUE'

			IF @p_debug = 1
				SELECT 'check_keys', c.* FROM @check_keys c

			IF EXISTS (
				SELECT
					k.item_key_value,
					COUNT(1)
				FROM 
					@check_keys k
				GROUP BY 
					k.item_key_value
				HAVING 
					COUNT(1) > 1)
				RAISERROR ('Duplicate key values found in input data - operation failed.', 16, 1)

			IF EXISTS (
				SELECT
					1 
				FROM
					COLLECTION.item_attribute ia
					INNER JOIN COLLECTION.item i 
					ON ia.item_id = i.item_id
					INNER JOIN @check_keys k
					ON ia.item_attr_id = k.item_attr_id AND ia.attr_value = k.item_key_value
				WHERE
					i.item_parent = @parent_coll_id)
				RAISERROR ('Key values found in input data that already exist - operation failed.', 16, 1)
		END

		BEGIN TRANSACTION

		DECLARE @curr_ident int = (SELECT IDENT_CURRENT('COLLECTION.item'))

		;WITH w_key AS 
		(
			SELECT DISTINCT 
				ck.item_key_value
			FROM
				@check_keys ck
		)
		INSERT INTO @insert_keys
		SELECT DISTINCT 
			w.item_key_value ,
			(ROW_NUMBER() OVER (ORDER BY w.item_key_value)) + @curr_ident
		FROM
			w_key w

		INSERT INTO COLLECTION.item (item_parent)
		SELECT
			@parent_coll_id
		FROM 
			@insert_keys k

		INSERT INTO COLLECTION.item_attribute (item_id, item_attr_id, attr_value)
		SELECT
			ik.parent_id,
			iaf.item_attr_id,
			i.attr_value
		FROM 
			@p_insert i
			INNER JOIN @insert_keys ik
			ON i.item_key_value = ik.item_key_value
			INNER JOIN COLLECTION.item_attribute_field iaf
			ON i.attr_name = iaf.item_attr_name
		WHERE
			i.parent_item IS NOT NULL			
		
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
PRINT '########## COMMON.c_person created successfully ##########'

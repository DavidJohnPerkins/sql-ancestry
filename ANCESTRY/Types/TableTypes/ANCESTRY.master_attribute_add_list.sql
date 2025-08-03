USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TYPE IF EXISTS ANCESTRY.master_attribute_add_list
GO

CREATE TYPE ANCESTRY.master_attribute_add_list AS TABLE   
(
	attr_type	int,
	attr_desc	varchar(255)
)
GO  
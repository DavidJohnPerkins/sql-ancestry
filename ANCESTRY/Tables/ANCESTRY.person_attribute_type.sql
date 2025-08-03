USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('ANCESTRY.person_attribute_type', 'U') IS NOT NULL
BEGIN
	DROP TABLE ANCESTRY.person_attribute_type
	PRINT '########## Table ANCESTRY.person_attribute_type dropped successfully ##########'
END
GO

CREATE TABLE ANCESTRY.person_attribute_type (
	id				int IDENTITY(1, 1) NOT NULL,
	attr_type		int NOT NULL,
	attr_type_desc	varchar(20) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE ANCESTRY.person_attribute_type ADD PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

INSERT INTO ANCESTRY.person_attribute_type (attr_type, attr_type_desc) VALUES
(1, 'STRING'),
(2, 'INT'),
(3, 'DATE')

PRINT '########## Table ANCESTRY.person_attribute_type created successfully ##########'

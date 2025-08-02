USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('ANCESTRY.person_attribute', 'U') IS NOT NULL
BEGIN
	DROP TABLE ANCESTRY.person_attribute
	PRINT '########## Table ANCESTRY.person_attribute dropped successfully ##########'
END
GO

CREATE TABLE ANCESTRY.person_attribute (
	id				int IDENTITY(1, 1) NOT NULL,
	attr_type		int NOT NULL,
	attr_desc		varchar(255) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE ANCESTRY.person_attribute ADD PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

PRINT '########## Table ANCESTRY.person_attribute created successfully ##########'

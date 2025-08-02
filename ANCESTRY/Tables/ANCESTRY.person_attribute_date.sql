USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('ANCESTRY.person_attribute_date', 'U') IS NOT NULL
BEGIN
	DROP TABLE ANCESTRY.person_attribute_date
	PRINT '########## Table ANCESTRY.person_attribute_date dropped successfully ##########'
END
GO

CREATE TABLE ANCESTRY.person_attribute_date
(
	id 			int IDENTITY(1, 1) 	NOT NULL,
	attr_id		int					NOT NULL,
	person_id	int					NOT NULL,
	attr_value	int					NOT NULL,
	valid_from	datetime			NOT NULL,
	valid_to	datetime 			NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE ANCESTRY.person_attribute_date ADD PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE ANCESTRY.person_attribute_date ADD CONSTRAINT FK_perattdate_attrid_attr FOREIGN KEY (attr_id) REFERENCES ANCESTRY.person_attribute(id) ON DELETE CASCADE;
ALTER TABLE ANCESTRY.person_attribute_date ADD CONSTRAINT FK_perattdate_personid_person FOREIGN KEY (person_id) REFERENCES ANCESTRY.person(id) ON DELETE CASCADE;

PRINT '########## Table ANCESTRY.person_attribute_date created successfully ##########'

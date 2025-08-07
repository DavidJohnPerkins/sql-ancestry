USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('ANCESTRY.person', 'U') IS NOT NULL
BEGIN
	DROP TABLE ANCESTRY.person
	PRINT '########## Table ANCESTRY.person dropped successfully ##########'
END
GO

CREATE TABLE ANCESTRY.person (
	id					int IDENTITY(1, 1) NOT NULL,
	person_code			varchar(50) NOT NULL,
	bio_father_id		int,
	bio_mother_id		int,
	adopt_father_id		int,
	adopt_mother_id		int
) ON [PRIMARY]
GO

ALTER TABLE ANCESTRY.person ADD PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE UNIQUE INDEX UQ_person_person_code   
   ON ANCESTRY.person (person_code);   
GO  

PRINT '########## Table ANCESTRY.person created successfully ##########'

GO

USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('ANCESTRY.person_relationship', 'U') IS NOT NULL
BEGIN
	DROP TABLE ANCESTRY.person_relationship
	PRINT '########## Table ANCESTRY.person_relationship dropped successfully ##########'
END
GO

CREATE TABLE ANCESTRY.person_relationship (
	id					int IDENTITY(1, 1) NOT NULL,
	person_id_1			int NOT NULL,
	person_id_2			int NOT NULL,
	relationship_start	date NOT NULL,
	relationship_end	date,
	is_marriage			bit
) ON [PRIMARY]
GO

ALTER TABLE ANCESTRY.person_relationship ADD PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE ANCESTRY.person_relationship ADD CONSTRAINT FK_perrel_personid1 FOREIGN KEY (person_id_1) REFERENCES ANCESTRY.person(id);
ALTER TABLE ANCESTRY.person_relationship ADD CONSTRAINT FK_perrel_personid2 FOREIGN KEY (person_id_2) REFERENCES ANCESTRY.person(id);

PRINT '########## Table ANCESTRY.person_relationship created successfully ##########'

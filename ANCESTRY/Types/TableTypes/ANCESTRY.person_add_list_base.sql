USE Ancestry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TYPE IF EXISTS ANCESTRY.person_add_list_base
GO

CREATE TYPE ANCESTRY.person_add_list_base AS TABLE   
(
	person_code		varchar(255),
	bio_father		int,
	bio_mother		int,
	adopt_father	int,
	adopt_mother	int
)
GO  

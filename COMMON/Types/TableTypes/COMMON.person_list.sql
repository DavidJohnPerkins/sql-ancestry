USE Ancestry
GO

DROP TYPE IF EXISTS COMMON.person_list

CREATE TYPE COMMON.person_list AS TABLE
(
	person_code		COMMON.person_code NOT NULL,
	attr_name		varchar(255) NOT NULL,
	attr_value		varchar(255) NOT NULL
)
GO

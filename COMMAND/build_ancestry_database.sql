-- Script to rebuild Ancestry database

SET NOCOUNT ON
GO

PRINT 'EXECUTING SCRIPTS...'

:ON ERROR EXIT

USE Ancestry
GO

SET NOCOUNT ON

DROP PROCEDURE IF EXISTS COMMON.c_person_attribute_list
DROP PROCEDURE IF EXISTS ANCESTRY.c_person_attribute_list

DROP TABLE IF EXISTS ANCESTRY.person_attribute_date
DROP TABLE IF EXISTS ANCESTRY.person_attribute_int
DROP TABLE IF EXISTS ANCESTRY.person_attribute_string
DROP TABLE IF EXISTS ANCESTRY.person_attribute
DROP TABLE IF EXISTS ANCESTRY.person_attribute_type
DROP TABLE IF EXISTS ANCESTRY.person

DROP TYPE IF EXISTS ANCESTRY.master_attribute_add_list
DROP TYPE IF EXISTS ANCESTRY.person_add_list_base
DROP TYPE IF EXISTS COMMON.json
DROP TYPE IF EXISTS COMMON.person_list
DROP TYPE IF EXISTS COMMON.person_code

GO

-- TYPES
:r "COMMON/Types/DataTypes/COMMON.json.sql"
:r "COMMON/Types/DataTypes/COMMON.person_code.sql"
:r "COMMON/Types/DataTypes/COMMON.person_list.sql"
:r "ANCESTRY/Types/TableTypes/ANCESTRY.master_attribute_add_list.sql"
:r "ANCESTRY/Types/TableTypes/ANCESTRY.person_add_list_base.sql"

-- TABLES
:r "ANCESTRY/Tables/ANCESTRY.person.sql"
:r "ANCESTRY/Tables/ANCESTRY.person_attribute_type.sql"
:r "ANCESTRY/Tables/ANCESTRY.person_attribute.sql"
:r "ANCESTRY/Tables/ANCESTRY.person_attribute_string.sql"
:r "ANCESTRY/Tables/ANCESTRY.person_attribute_int.sql"
:r "ANCESTRY/Tables/ANCESTRY.person_attribute_date.sql"

-- FUNCTIONS

-- VIEWS

-- STORED PROCEDURES
:r "COMMON/StoredProcedures/COMMON.c_person_attribute_list.sql"
:r "ANCESTRY/StoredProcedures/ANCESTRY.c_person_attribute_list.sql"
GO

-- SEED DATA
:r "ANCESTRY/Script/create_adam_and_eve.sql"

PRINT 'SCRIPT COMPLETE'


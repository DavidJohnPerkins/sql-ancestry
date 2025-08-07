USE Ancestry
GO

DECLARE @attrs_string TABLE (
	person_code	varchar(50),
	attr_desc	varchar(255),
	attr_value	varchar(255)
)

DECLARE @attrs_date TABLE (
	person_code	varchar(50),
	attr_desc	varchar(255),
	attr_value	date
)

DECLARE @json	COMMON.json = '
	{
		"update_type":	"REPLACE",
		"attr_list": [
			{ "attr_type": 1, "attr_desc": "first_name" },
			{ "attr_type": 1, "attr_desc": "middle_name" },
			{ "attr_type": 1, "attr_desc": "surname" },
			{ "attr_type": 3, "attr_desc": "date_of_birth" },
			{ "attr_type": 3, "attr_desc": "date_of_death" },
			{ "attr_type": 1, "attr_desc": "place_of_birth" },
			{ "attr_type": 1, "attr_desc": "place_of_death" }
		]
	}
'
EXEC ANCESTRY.c_person_attribute_list @json, true, true

SET IDENTITY_INSERT ANCESTRY.person ON
INSERT INTO ANCESTRY.person (id, person_code, bio_father_id, bio_mother_id) VALUES (1, 'ADAM', 1, 2), (2, 'EVE', 1, 2)
SET IDENTITY_INSERT ANCESTRY.person OFF

INSERT INTO @attrs_string VALUES 
('ADAM', 'first_name', 'Adam'),
('ADAM', 'middle_name', 'None'),
('ADAM', 'surname', 'Eden'),
('ADAM', 'place_of_birth', 'Eden'),
('ADAM', 'place_of_death', 'Eden'),
('EVE', 'first_name', 'Eve'),
('EVE', 'middle_name', 'None'),
('EVE', 'surname', 'Eden'),
('EVE', 'place_of_birth', 'Eden'),
('EVE', 'place_of_death', 'Eden')

INSERT INTO ANCESTRY.person_attribute_string (attr_id, person_id, attr_value, valid_from, valid_to)
SELECT 
	pa.id,
	p.id,
	a.attr_value,
	'1900-01-01',
	'9999-12-31'
FROM 
	@attrs_string a 
	INNER JOIN ANCESTRY.person p 
	ON a.person_code = p.person_code
	INNER JOIN ANCESTRY.person_attribute pa
	ON a.attr_desc = pa.attr_desc

INSERT INTO @attrs_date VALUES 
('ADAM', 'date_of_birth', '1000-01-01'),
('ADAM', 'date_of_death', '1100-01-01'),
('EVE', 'date_of_birth', '1000-01-01'),
('EVE', 'date_of_death', '1100-01-01')

INSERT INTO ANCESTRY.person_attribute_date (attr_id, person_id, attr_value, valid_from, valid_to)
SELECT 
	pa.id,
	p.id,
	a.attr_value,
	'1900-01-01',
	'9999-12-31'
FROM 
	@attrs_date a 
	INNER JOIN ANCESTRY.person p 
	ON a.person_code = p.person_code
	INNER JOIN ANCESTRY.person_attribute pa
	ON a.attr_desc = pa.attr_desc

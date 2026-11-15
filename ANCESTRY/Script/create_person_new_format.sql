DECLARE @p_input_json COMMON.json

SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"PERKI000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Perkins",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"TOYNB000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Toynbee",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		}
	]
}';
SET @p_input_json = N'
{
	"person":[
		{
			"person_code": 			"PERKI212265JM",
			"father_code":			"PERKI000000XX",
			"mother_code":			"TOYNB000000XX",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"John",
			"middle_name":			"Maurice",
			"surname":				"Perkins",
			"gender":				"M",
			"date_of_birth":		"1925-12-26",
			"date_of_death":		"2012-09-12",
			"place_of_birth":		"West Bromwich",
			"place_of_death":		"Keyworth"
		},
		{
			"person_code":			"TOYNB303225AM",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Anne",
			"middle_name":			"Moya",
			"surname":				"Toynbee",
			"gender":				"F",
			"date_of_birth":		"1935-03-22",
			"date_of_death":		"2024-10-10",
			"place_of_birth":		"Smethwick",
			"place_of_death":		"Keyworth"
		}
	]
}'
SET @p_input_json = N'
{
	"person":[
		{
			"person_code": 			"PERKI610140KM",
			"father_code":			"PERKI212265JM",
			"mother_code":			"TOYNB303225AM",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Kathryn",
			"middle_name":			"Margaret",
			"surname":				"Perkins",
			"gender":				"F",
			"date_of_birth":		"1960-10-14",
			"date_of_death":		null,
			"place_of_birth":		"Stourbridge",
			"place_of_death":		null
		},
		{
			"person_code":			"PERKI607013DJ",
			"father_code":			"PERKI212265JM",
			"mother_code":			"TOYNB303225AM",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"David",
			"middle_name":			"John",
			"surname":				"Perkins",
			"gender":				"M",
			"date_of_birth":		"1963-01-07",
			"date_of_death":		null,
			"place_of_birth":		"Halesowen",
			"place_of_death":		null
		}
	]
}'
SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"THOMS000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Thomson",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"DAVIS000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Davis",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"GUNDR000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Gundry",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"SORRE000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Sorrell",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		}
	]
}';
SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"SORRE001015DD",
			"father_code":			"SORRE000000XX",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Dorothy",
			"middle_name":			"",
			"surname":				"Sorrell",
			"gender":				"F",
			"date_of_birth":		"1905-01-01",
			"date_of_death":		"1999-02-26",
			"place_of_birth":		"Writtle",
			"place_of_death":		"Bristol"
		}
	]
}'
SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"SORRE000000CC",
			"father_code":			"SORRE000000XX",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Clifford",
			"middle_name":			"",
			"surname":				"Sorrell",
			"gender":				"M",
			"date_of_birth":		"1905-01-01",
			"date_of_death":		"1999-02-26",
			"place_of_birth":		"Writtle",
			"place_of_death":		"Bristol"
		}
	]
}'

SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"SORRE201269MM",
			"father_code":			"SORRE000000CC",
			"mother_code":			"SORRE001015DD",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Margaret",
			"middle_name":			"",
			"surname":				"Sorrell",
			"gender":				"F",
			"date_of_birth":		"1929-01-26",
			"date_of_death":		"1998-07-30",
			"place_of_birth":		"Writtle",
			"place_of_death":		"Bristol"
		}
	]
}'
SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"DAVIS000000AA",
			"father_code":			"DAVIS000000XX",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Ann",
			"middle_name":			"",
			"surname":				"Davis",
			"gender":				"F",
			"date_of_birth":		"1900-01-01",
			"date_of_death":		"1900-01-01",
			"place_of_birth":		"Wales",
			"place_of_death":		"Essex"
		},
		{
			"person_code":			"THOMS000000JJ",
			"father_code":			"THOMS000000XX",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"John",
			"middle_name":			"",
			"surname":				"Thomson",
			"gender":				"M",
			"date_of_birth":		"1944-01-01",
			"date_of_death":		"1966-04-08",
			"place_of_birth":		"Catrine",
			"place_of_death":		"Catrine"
		}
	]
}'
SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"GUNDR211016CS",
			"father_code":			"GUNDR000000XX",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Cecil",
			"middle_name":			"Stafford",
			"surname":				"Gundry",
			"gender":				"M",
			"date_of_birth":		"1926-11-04",
			"date_of_death":		"2019-09-11",
			"place_of_birth":		"Streatham",
			"place_of_death":		"Long Ashton"
		}
	]
}'
SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"GUNDR603274SE",
			"father_code":			"THOMS000000JJ",
			"mother_code":			"DAVIS000000AA",
			"adopt_father_code":	"GUNDR211016CS",
			"adopt_mother_code":	"SORRE201269MM",
			"first_name":			"Sarah",
			"middle_name":			"Elizabeth",
			"surname":				"Gundry",
			"gender":				"F",
			"date_of_birth":		"1964-03-27",
			"date_of_death":		null,
			"place_of_birth":		"Salisbury",
			"place_of_death":		null
		}
	]
}'
SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"PERKI904098CL",
			"father_code":			"PERKI607013DJ",
			"mother_code":			"GUNDR603274SE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Charlotte",
			"middle_name":			"Lucy",
			"surname":				"Perkins",
			"gender":				"F",
			"date_of_birth":		"1998-04-09",
			"date_of_death":		null,
			"place_of_birth":		"Epsom",
			"place_of_death":		null
		},
		{
			"person_code":			"PERKI904098Z",
			"father_code":			"PERKI607013DJ",
			"mother_code":			"GUNDR603274SE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Zoe",
			"middle_name":			"Hannah",
			"surname":				"Perkins",
			"gender":				"F",
			"date_of_birth":		"1998-04-09",
			"date_of_death":		null,
			"place_of_birth":		"Epsom",
			"place_of_death":		null
		}
	]
}'

EXEC ANCESTRY.c_person @p_input_json, 0, 1

select * from ANCESTRY.person

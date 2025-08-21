USE Ancestry
GO

DECLARE @json_data COMMON.json

SET @json_data = N'[{  
	"person":[
		{
			"person_code": "PERKI000000XX",
			"person_attribute": [
				{ "attr_name": "father_code",		"attr_value": "ADAM" },
				{ "attr_name": "mother_code",		"attr_value": "EVE" },
				{ "attr_name": "first_name", 		"attr_value": "Perkins" },
				{ "attr_name": "middle_name",		"attr_value": "Family" },
				{ "attr_name": "surname",			"attr_value": "Ancestor" },
				{ "attr_name": "date_of_birth",		"attr_value": "1000-01-01" },
				{ "attr_name": "date_of_death",		"attr_value": "1100-01-01" },
				{ "attr_name": "place_of_birth",	"attr_value": "Earth" },
				{ "attr_name": "place_of_death",	"attr_value": "Heaven" }
			]
		},
		{
			"person_code": "TOYNB000000XX",
			"person_attribute": [
				{ "attr_name": "father_code",		"attr_value": "ADAM" },
				{ "attr_name": "mother_code",		"attr_value": "EVE" },
				{ "attr_name": "first_name", 		"attr_value": "Toynbee" },
				{ "attr_name": "middle_name",		"attr_value": "Family" },
				{ "attr_name": "surname",			"attr_value": "Ancestor" },
				{ "attr_name": "date_of_birth",		"attr_value": "1000-01-01" },
				{ "attr_name": "date_of_death",		"attr_value": "1100-01-01" },
				{ "attr_name": "place_of_birth",	"attr_value": "Earth" },
				{ "attr_name": "place_of_death",	"attr_value": "Heaven" }
			]
		}
	]
}]';
--select @json_data
EXEC ANCESTRY.c_person @json_data, false, true

/*
	"person":[{
		"person_code": "PERKI212265JM",
		"person_attribute": [
			{ "father_code":	"ADAM" },
			{ "mother_code":	"EVE" },
			{ "first_name": 	"John" },
			{ "middle_name":	"Maurice" },
			{ "surname":		"Perkins" },
			{ "date_of_birth":	"1925-12-26" },
			{ "date_of_death":	"2012-09-12" },
			{ "place_of_birth":	"West Bromwich" },
			{ "place_of_death":	"Keyworth" }]},
		"person_code": "TOYNB303225AM",
		"person_attribute": [
			{ "father_code":	"ADAM" },
			{ "mother_code":	"EVE" },
			{ "first_name": 	"Anne" },
			{ "middle_name":	"Moya" },
			{ "surname":		"Toynbee" },
			{ "date_of_birth":	"1935-03-22" },
			{ "date_of_death":	"2024-10-10" },
			{ "place_of_birth":	"Smethwick" },
			{ "place_of_death":	"Keyworth" }]}
	]
*/
/*
		"person_code": "PERKI607013DJ",
		"person_attribute": [
			{ "father_code":	"PERKI212265JM" },
			{ "mother_code":	"" },
			{ "first_name": 	"David" },
			{ "middle_name":	"John" },
			{ "surname":		"Perkins" },
			{ "date_of_birth":	"1963-07-01" },
			{ "date_of_death":	"9999-12-31" },
			{ "place_of_birth":	"Halesowen" },
			{ "place_of_death":	"" }]},
*/
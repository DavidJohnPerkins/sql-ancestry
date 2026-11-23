DECLARE @p_input_json COMMON.json

SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"ADAMS000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Adams",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"ADAMS000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Adams",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
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
			"person_code":			"DAVIS000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Davis",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
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
			"person_code":			"GUNDR000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Gundry",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"HARRI000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Harrison",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"HARRI000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Harrison",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
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
			"person_code":			"PERKI000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Perkins",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"RICHA000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Richardson",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"RICHA000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Richardson",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
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
		},
		{
			"person_code":			"SORRE000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Sorrell",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
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
			"person_code":			"THOMS000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Thomson",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
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
		},
		{
			"person_code":			"TOYNB000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Toynbee",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"BOURN000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Bourne",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"BOURN000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Bourne",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"BREWA000000XX",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Breward",
			"middle_name":			"Family",
			"surname":				"Ancestor",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"BREWA000000YY",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Breward",
			"middle_name":			"Family",
			"surname":				"Ancestor (mother)",
			"gender":				"F",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"BREWA000000ZZ",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Breward",
			"middle_name":			"Family",
			"surname":				"Ancestor (Jean father)",
			"gender":				"M",
			"date_of_birth":		"1000-01-01",
			"date_of_death":		"1100-01-01",
			"place_of_birth":		"Earth",
			"place_of_death":		"Heaven"
		},
		{
			"person_code":			"BREWA000000QQ",
			"father_code":			"ADAM",
			"mother_code":			"EVE",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Breward",
			"middle_name":			"Family",
			"surname":				"Ancestor (Jean mother)",
			"gender":				"F",
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
			"person_code":			"PERKI001015JB",
			"father_code":			"PERKI000000XX",
			"mother_code":			"PERKI000000YY",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Joseph",
			"middle_name":			"Benjamin",
			"surname":				"Perkins",
			"gender":				"M",
			"date_of_birth":		"1902-01-01",
			"date_of_death":		"1950-01-01",
			"place_of_birth":		"West Bromwich",
			"place_of_death":		"West Bromwich"
		},
		{
			"person_code":			"ADAMS001012GG",
			"father_code":			"ADAMS000000XX",
			"mother_code":			"ADAMS000000YY",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Gertrude",
			"middle_name":			null,
			"surname":				"Adams",
			"gender":				"F",
			"date_of_birth":		"1902-01-01",
			"date_of_death":		"1958-01-01",
			"place_of_birth":		"West Bromwich",
			"place_of_death":		"Smethwick"
		}
	]
}'
--EXEC ANCESTRY.c_person @p_input_json, 0, 1

SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"TOYNB041012JW",
			"father_code":			"TOYNB000000XX",
			"mother_code":			"TOYNB000000YY",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"John",
			"middle_name":			"William",
			"surname":				"Toynbee",
			"gender":				"M",
			"date_of_birth":		"1904-10-12",
			"date_of_death":		"1990-01-01",
			"place_of_birth":		"Heignton",
			"place_of_death":		"Nottingham"
		},
		{
			"person_code":			"HARRI000000MM",
			"father_code":			"HARRI000000XX",
			"mother_code":			"HARRI000000YY",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Margaret",
			"middle_name":			null,
			"surname":				"Harrison",
			"gender":				"F",
			"date_of_birth":		"1900-01-01",
			"date_of_death":		"1970-01-01",
			"place_of_birth":		"Lincoln",
			"place_of_death":		"Smethwick"
		}
	]
}'
--EXEC ANCESTRY.c_person @p_input_json, 0, 1

SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"SORRE000000CC",
			"father_code":			"SORRE000000XX",
			"mother_code":			"SORRE000000YY",
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
		},
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
--EXEC ANCESTRY.c_person @p_input_json, 0, 1

SET @p_input_json = N'
{
	"person":[
		{
			"person_code": 			"PERKI212265JM",
			"father_code":			"PERKI001015JB",
			"mother_code":			"ADAMS001012GG",
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
			"person_code": 			"PERKI201018GG",
			"father_code":			"PERKI001015JB",
			"mother_code":			"ADAMS001012GG",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Geoffrey",
			"middle_name":			null,
			"surname":				"Perkins",
			"gender":				"M",
			"date_of_birth":		"1928-01-01",
			"date_of_death":		"2000-01-01",
			"place_of_birth":		"West Bromwich",
			"place_of_death":		"Llandryddnod Wells"
		},
		{
			"person_code": 			"PERKI201015MM",
			"father_code":			"PERKI001015JB",
			"mother_code":			"ADAMS001012GG",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Maureen",
			"middle_name":			null,
			"surname":				"Perkins",
			"gender":				"F",
			"date_of_birth":		"1925-01-01",
			"date_of_death":		"2010-01-01",
			"place_of_birth":		"West Bromwich",
			"place_of_death":		"Sutton Coldfield"
		},
		{
			"person_code": 			"PERKI2010122DD",
			"father_code":			"PERKI001015JB",
			"mother_code":			"ADAMS001012GG",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"Dorothy",
			"middle_name":			null,
			"surname":				"Perkins",
			"gender":				"F",
			"date_of_birth":		"1922-01-01",
			"date_of_death":		"2000-01-01",
			"place_of_birth":		"West Bromwich",
			"place_of_death":		"Sutton Coldfield"
		},
		{
			"person_code":			"TOYNB303225WS",
			"father_code":			"TOYNB041012JW",
			"mother_code":			"HARRI000000MM",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name": 			"William",
			"middle_name":			"Stephen",
			"surname":				"Toynbee",
			"gender":				"M",
			"date_of_birth":		"1938-03-27",
			"date_of_death":		null,
			"place_of_birth":		"Smethwick",
			"place_of_death":		null
		},
		{
			"person_code":			"TOYNB303225AM",
			"father_code":			"TOYNB041012JW",
			"mother_code":			"HARRI000000MM",
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
--EXEC ANCESTRY.c_person @p_input_json, 0, 1

SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"GUNDR211016CS",
			"father_code":			"GUNDR000000XX",
			"mother_code":			"GUNDR000000YY",
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
		},
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
--EXEC ANCESTRY.c_person @p_input_json, 0, 1

SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"DAVIS000000AA",
			"father_code":			"DAVIS000000XX",
			"mother_code":			"DAVIS000000YY",
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
			"mother_code":			"THOMS000000YY",
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
--EXEC ANCESTRY.c_person @p_input_json, 0, 1

SET @p_input_json = N'
{  
	"person":[
		{
			"person_code":			"BREWA351010JJ",
			"father_code":			"BREWA000000XX",
			"mother_code":			"BREWA000000YY",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"James",
			"middle_name":			"",
			"surname":				"Breward",
			"gender":				"M",
			"date_of_birth":		"1935-01-01",
			"date_of_death":		"2005-01-01",
			"place_of_birth":		"Stoke-on-Trent",
			"place_of_death":		"Stoke-on-Trent"
		},
		{
			"person_code":			"BREWA000000JE",
			"father_code":			"BREWA000000ZZ",
			"mother_code":			"BREWA000000QQ",
			"adopt_father_code":	null,
			"adopt_mother_code":	null,
			"first_name":			"Jean",
			"middle_name":			"",
			"surname":				"Breward",
			"gender":				"F",
			"date_of_birth":		"1935-01-01",
			"date_of_death":		"2015-01-01",
			"place_of_birth":		"Stoke-on-Trent",
			"place_of_death":		"Nottingham"
		}
	]
}'
EXEC ANCESTRY.c_person @p_input_json, 0, 1

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
--EXEC ANCESTRY.c_person @p_input_json, 0, 1

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
--EXEC ANCESTRY.c_person @p_input_json, 0, 1

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
			"person_code":			"PERKI904098ZH",
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



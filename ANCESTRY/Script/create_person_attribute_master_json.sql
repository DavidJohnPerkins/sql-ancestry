USE Ancestry
GO

DECLARE @json	COMMON.json = '
	{
		"update_type":	"CREATE",
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
select @json

EXEC ANCESTRY.c_person_attribute_list @json, true, true

note
	description: "[
		Mock representation of a {RP_DATA_ELEMENT} as {MOCK_DATA_ITEM}.
		]"

class
	MOCK_DATA_ITEM

inherit
	RP_DATA_ELEMENT

create
	make_with_data
	
feature -- Anchor

	items_type_anchor: detachable TUPLE [street_number, street_name, street_suffix, city, state, ZIP: STRING]
			-- <Precursor>
			-- Common address data (street_number, street_name, street_suffix, city, state, ZIP)

end

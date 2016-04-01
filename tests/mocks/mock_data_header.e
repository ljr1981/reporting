note
	description: "[
		Mock representation of a {MOCK_DATA_HEADER}.
		]"

class
	MOCK_DATA_HEADER

inherit
	RP_DATA_HEADER

feature -- Access

	items: ARRAY [STRING]
			-- <Precursor>
			-- Headers for "Number", "Name", "Suffix", "City", "State", "ZIP"
		do
			Result := <<"Number", "Name", "Suffix", "City", "State", "ZIP">>
		end

end

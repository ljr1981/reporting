note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	RP_DATA_TABLE_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

feature -- Test routines

	rp_data_table_basic_tests
			-- `rp_data_table_basic_tests'
		local
			l_table: RP_DATA_TABLE [MOCK_DATA_ITEM]
		do
			create l_table.make_with_data (<<["2707", "AIMAR", "AVE", "SAVANNAH", "GA", "31406"], ["2709", "AIMAR", "AVE", "SAVANNAH", "GA", "31406"]>>, create {MOCK_DATA_HEADER})
			assert_strings_equal ("two_addresses", two_addresses, l_table.html_out)
		end

feature {NONE} -- Support

	two_addresses: STRING = "<table><tr><th>Number</th><th>Name</th><th>Suffix</th><th>City</th><th>State</th><th>ZIP</th></tr><tr><td>2707</td><td>AIMAR</td><td>AVE</td><td>SAVANNAH</td><td>GA</td><td>31406</td></tr><tr><td>2709</td><td>AIMAR</td><td>AVE</td><td>SAVANNAH</td><td>GA</td><td>31406</td></tr></table>"

feature {NONE} -- Implementation

	randomizer: RANDOMIZER once create Result end

end



note
	description: "[
		Tests of {RP_DATA_ELEMENT}.
		]"
	testing: "type/manual"

class
	RP_DATA_ELEMENT_TEST_SET

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

	rp_data_element_basic_tests
			-- `rp_data_element_basic_tests'
		local
			l_element: MOCK_DATA_ITEM
			l_header: MOCK_DATA_HEADER
		do
			create l_header
			create l_element.make_with_data (["2707", "AIMAR", "AVE", "SAVANNAH", "GA", "31406"], l_header)
			across
				(1 |..| randomizer.random_integer_in_range (1_000 |..| 2_000)) as ic
			loop
				create l_element.make_with_data (randomizer.random_address_tuple, l_header)
			end
		end

feature {NONE} -- Implementation

	randomizer: RANDOMIZER once create Result end

end



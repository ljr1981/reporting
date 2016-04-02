note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	RP_HTML_TAG_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	rp_html_tag_basic_tests
			-- `rp_html_tag_basic_tests'.
		local
			l_html: RP_HTML_PAGE
			l_table: RP_DATA_TABLE [MOCK_DATA_ITEM]
		do
			assert ("not_implemented", False)
		end

end



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

	rp_html_tag_basic_tests
			-- `rp_html_tag_basic_tests'.
		local
			l_html: RP_HTML_PAGE
			l_table: RP_DATA_TABLE [MOCK_DATA_ITEM]
			l_head: RP_HTML_HEAD
			l_body: RP_HTML_BODY

			l_base: RP_HTML_BASE
			l_link: RP_HTML_LINK
			l_meta: RP_HTML_META
			l_script: RP_HTML_SCRIPT
			l_style: RP_HTML_STYLE
			l_title: RP_HTML_TITLE
		do
			create l_html
			assert_strings_equal ("html_page", "<!DOCTYPE html><html></html>", l_html.html_out)
			create l_head
			l_html.set_head (l_head)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head></head></html>", l_html.html_out)
			create l_body
			l_html.set_body (l_body)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head></head><body></body></html>", l_html.html_out)

			create l_base
			l_head.set_base (l_base)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base></head><body></body></html>", l_html.html_out)
			create l_link
			l_head.set_link (l_link)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link></head><body></body></html>", l_html.html_out)
			create l_meta
			l_head.set_meta (l_meta)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link><meta></meta></head><body></body></html>", l_html.html_out)
			create l_script
			l_head.set_script (l_script)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link><meta></meta><script></script></head><body></body></html>", l_html.html_out)
			create l_style
			l_head.set_style (l_style)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><base></base><link></link><meta></meta><script></script><style></style></head><body></body></html>", l_html.html_out)
			create l_title
			l_head.set_title (l_title)
			assert_strings_equal ("html_page", "<!DOCTYPE html><html><head><title></title><base></base><link></link><meta></meta><script></script><style></style></head><body></body></html>", l_html.html_out)
		end

	general_html_tag_creation_tests
			-- `general_html_tag_creation_tests'.
		local
			l_a: RP_HTML_A
			l_br: RP_HTML_BR
			l_div: RP_HTML_DIV
			l_footer: RP_HTML_FOOTER
			l_form: RP_HTML_FORM
			l_h1: RP_HTML_H1
			l_h2: RP_HTML_H2
			l_h3: RP_HTML_H3
		do
			create l_a
			create l_br
			create l_div
			create l_footer
			create l_form
			create l_h1
			create l_h2
			create l_h3
		end

end



note
	description: "[
		Tests of {REPORTING}.
		]"
	testing: "type/manual"

class
	REPORTING_TEST_SET

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

feature {NONE} -- In-system

	html_base: detachable RP_HTML_BASE
	html_head: detachable RP_HTML_HEAD
	html_link: detachable RP_HTML_LINK
	html_meta: detachable RP_HTML_META
	html_script: detachable RP_HTML_SCRIPT
	html_style: detachable RP_HTML_STYLE
	html_title: detachable RP_HTML_TITLE

end

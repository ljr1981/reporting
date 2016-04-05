note
	description: "[
		Representation of an {RP_HTML_NAV}.
		]"

class
	RP_HTML_NAV

inherit
	RP_ANY

	RP_HTML_TAG
		undefine
			default_create,
			out
		end

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {RP_HTML_NAV}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "nav"
			-- <Precursor>

;note
	design: "[
Tag    Description
<nav>    Defines a set of navigation links.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_nav.asp"

end

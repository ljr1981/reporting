note
	description: "[
		Representation of an {RP_HTML_BASE}.
		]"

class
	RP_HTML_BASE

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
			-- HTML output for Current {RP_HTML_BASE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "base"
			-- <Precursor>

;note
	design: "[
Tag    Description
<base>    Defines a default address or a default target for all links on a page
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_base.asp"

end

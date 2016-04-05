note
	description: "[
		Representation of an {RP_HTML_UL}.
		]"

class
	RP_HTML_UL

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
			-- HTML output for Current {RP_HTML_UL}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "ul"
			-- <Precursor>

;note
	design: "[
Tag    Description
<ul>    Defines an unordered (bulleted) list
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_ul.asp"

end

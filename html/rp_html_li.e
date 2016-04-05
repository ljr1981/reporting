note
	description: "[
		Representation of an {RP_HTML_LI}.
		]"

class
	RP_HTML_LI

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
			-- HTML output for Current {RP_HTML_LI}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "li"
			-- <Precursor>

;note
	design: "[
Tag    Description
<li>    Defines a list item
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_li.asp"

end

note
	description: "[
		Representation of an {RP_HTML_P}.
		]"

class
	RP_HTML_A

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
			-- HTML output for Current {RP_HTML_P}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "p"
			-- <Precursor>

;note
	design: "[
Tag    Description
<p>    Defines a paragraph
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_p.asp"

end

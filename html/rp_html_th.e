note
	description: "[
		Representation of an {RP_HTML_TH}.
		]"

class
	RP_HTML_TH

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
			-- HTML output for Current {RP_HTML_TH}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "th"
			-- <Precursor>

;note
	design: "[
Tag    Description
<th>    Defines a header cell in an HTML table
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_th.asp"

end

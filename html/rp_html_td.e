note
	description: "[
		Representation of an {RP_HTML_TD}.
		]"

class
	RP_HTML_TD

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
			-- HTML output for Current {RP_HTML_TD}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "td"
			-- <Precursor>

;note
	design: "[
Tag    Description
<td>    Defines a standard cell in an HTML table
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_td.asp"

end

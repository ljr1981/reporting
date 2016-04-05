note
	description: "[
		Representation of an {RP_HTML_TR}.
		]"

class
	RP_HTML_TR

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
			-- HTML output for Current {RP_HTML_TR}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "tr"
			-- <Precursor>

;note
	design: "[
Tag    Description
<tr>    Defines a row in an HTML table
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_tr.asp"

end

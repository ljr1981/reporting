note
	description: "[
		Representation of an {RP_HTML_TABLE}.
		]"

class
	RP_HTML_TABLE

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
			-- HTML output for Current {RP_HTML_TABLE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "table"
			-- <Precursor>

;note
	design: "[
Tag    Description
<table>    Defines an HTML table
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_table.asp"

end

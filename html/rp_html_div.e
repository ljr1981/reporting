note
	description: "[
		Representation of an {RP_HTML_DIV}.
		]"

class
	RP_HTML_DIV

inherit
	RP_ANY

	RP_HTML_TAG
		undefine
			default_create,
			out
		end

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {RP_HTML_DIV}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "form"
			-- <Precursor>

;note
	design: "[
Tag    Description
<div>    Defines a division or a section in an HTML document
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_div.asp"

end

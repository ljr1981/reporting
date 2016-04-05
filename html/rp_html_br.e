note
	description: "[
		Representation of an {RP_HTML_BR}.
		]"

class
	RP_HTML_BR

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
			-- HTML output for Current {RP_HTML_BR}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "br"
			-- <Precursor>

;note
	design: "[
Tag    Description
<br>    Inserts a single line break
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_br.asp"

end

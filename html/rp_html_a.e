note
	description: "[
		Representation of an {RP_HTML_A}.
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

create
	default_create,
	make_with_content
	
feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {RP_HTML_A}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "a"
			-- <Precursor>

;note
	design: "[
Tag    Description
<a>    Defines a hyperlink, which is used to link from one page to another
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_a.asp"

end

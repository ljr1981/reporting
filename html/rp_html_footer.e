note
	description: "[
		Representation of an {RP_HTML_FOOTER}.
		]"

class
	RP_HTML_FOOTER

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
			-- HTML output for Current {RP_HTML_FOOTER}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "footer"
			-- <Precursor>

;note
	design: "[
Tag    Description
<footer>    Defines a footer for a document or section
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_footer.asp"

end

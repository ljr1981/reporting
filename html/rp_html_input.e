note
	description: "[
		Representation of an {RP_HTML_INPUT}.
		]"

class
	RP_HTML_INPUT

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
			-- HTML output for Current {RP_HTML_INPUT}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "input"
			-- <Precursor>

;note
	design: "[
Tag    Description
<input>    Specifies an input field where the user can enter data
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_input.asp"

end

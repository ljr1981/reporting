note
	description: "[
		Representation of an {RP_HTML_H1}.
		]"

class
	RP_HTML_H1

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
			-- HTML output for Current {RP_HTML_H1}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "h1"
			-- <Precursor>

;note
	design: "[
Tag    Description
<h1>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end

note
	description: "[
		Representation of an {RP_HTML_H5}.
		]"

class
	RP_HTML_H5

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
			-- HTML output for Current {RP_HTML_H5}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "h5"
			-- <Precursor>

;note
	design: "[
Tag    Description
<h5>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end

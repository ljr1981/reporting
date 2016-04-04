note
	description: "[
		Representation of an {RP_HTML_IMG}.
		]"

class
	RP_HTML_IMG

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

	tag_name: STRING = "img"
			-- <Precursor>

;note
	design: "[
Tag    Description
<img>    Defines an image in an HTML page
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_img.asp"

end

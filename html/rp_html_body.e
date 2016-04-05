note
	description: "[
		Representation of an {RP_HTML_BODY}.
		]"

class
	RP_HTML_BODY

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
			-- HTML output for Current {RP_HTML_TITLE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "body"
			-- <Precursor>

;note
	design: "[
Tag    Description
<body>    Defines the body of a document
		]"
	EIS: "name=title", "src=http://www.w3schools.com/tags/tag_body.asp"

end

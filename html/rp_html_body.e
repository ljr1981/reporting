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
			if attached a as al_a then Result.append_string (al_a.html_out) end
		end

	tag_name: STRING = "body"
			-- <Precursor>

feature -- Settings

	set_a (a_a: like a)
			-- `set_a' with `a_a' into `a'.
		do
			a := a_a
		ensure
			set: a ~ a_a
		end

feature -- Implementation

	a: detachable RP_HTML_A
			-- `a' of Current {RP_HTML_PAGE}.

;note
	design: "[
Tag    Description
<body>    Defines the body of a document
		]"
	EIS: "name=title", "src=http://www.w3schools.com/tags/tag_body.asp"

end

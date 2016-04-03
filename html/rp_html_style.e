note
	description: "[
		Representation of an {RP_HTML_STYLE}.
		]"

class
	RP_HTML_STYLE

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
			-- HTML output for Current {RP_HTML_STYLE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "style"
			-- <Precursor>

;note
	design: "[
Tag    Description
<style>    Defines style information for a document
		]"
	EIS: "name=style", "src=http://www.w3schools.com/tags/tag_style.asp"

end

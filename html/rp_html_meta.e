note
	description: "[
		Abstract notion of an {RP_HTML_META}.
		]"

class
	RP_HTML_META

inherit
	RP_ANY

	RP_HTML_TAG
		undefine
			default_create,
			out
		redefine
			html_out
		end

feature -- Output

	html_out: STRING
			-- `html_out' of Current {RP_HTML_TAG}.
		do
			create Result.make_empty
			Result.append_string (start_tag)
			if attached attributes_out as al_attributes_out and then not al_attributes_out.is_empty then
				Result.replace_substring_all (tag_attributes_tag, " " + al_attributes_out)
			else
				Result.replace_substring_all (tag_attributes_tag, create {STRING}.make_empty)
			end
			Result.append_string (html_content)
			Result.append_string (end_tag)
		end

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {RP_HTML_PAGE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "meta"

;note
	design: "[
Tag    Description
<meta>    Defines metadata about an HTML document
		]"
	EIS: "name=meta", "src=http://www.w3schools.com/tags/tag_meta.asp"

end
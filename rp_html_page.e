note
	description: "[
		Representation of an {RP_HTML_PAGE}.
		]"
	design: "[
		See class notes at the end of the class.
		]"

class
	RP_HTML_PAGE

inherit
	RP_ANY

	RP_HTML_TAG
		undefine
			default_create,
			out
		end

feature -- Output

	html_out: STRING
			-- <Precursor>
			-- HTML output for Current {RP_HTML_PAGE}.
		do
			create Result.make_empty
			Result.append_string (start_tag)

			Result.append_string (end_tag)
		end

	tag_name: STRING = "html"

;note
	design: "[

		]"

end

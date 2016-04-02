note
	description: "[
		Abstract notion of an {RP_HTML_TAG}.
		]"

deferred class
	RP_HTML_TAG

inherit
	FW_ATTRIBUTE_HELPER
		redefine
			attribute_separator
		end

feature -- Output

	html_out: STRING
			-- `html_out' of Current {RP_HTML_TAG}.
		deferred
		end

	tag_name: STRING
			-- `tag_name' for `html_out' of Current {RP_HTML_TAG}.
		deferred
		end

feature {NONE} -- Implementation: Constants

	start_tag: STRING once ("object") Result := "<" + tag_name + tag_attributes_tag + ">" end

	end_tag: STRING once ("object")  Result := "</" + tag_name + ">" end

	tag_attributes_tag: STRING = "<<TAG_ATTRIBUTES>>"

	attribute_separator: STRING = "  "

end

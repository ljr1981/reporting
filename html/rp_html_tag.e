note
	description: "[
		Abstract notion of an {RP_HTML_TAG}.
		]"

deferred class
	RP_HTML_TAG

inherit
	FW_ATTRIBUTE_HELPER
		redefine
			attribute_separator,
			attribute_list
		end

feature -- Attributes

	global_accesskey: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_accesskey.asp"
		attribute Result := ["", "", Void, "accesskey", is_quoted] end
	global_class: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_class.asp"
		attribute Result := ["", "", Void, "class", is_quoted] end
	global_style: attached like attribute_tuple_anchor
		note EIS: "src=http://www.w3schools.com/tags/att_global_style.asp"
		attribute Result := ["", "", Void, "style", is_quoted] end

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
			-- <Precursor>
			-- HTML attributes for <table>
		do
			create Result.make (Default_capacity)
			Result.force (global_accesskey, "accesskey")
			Result.force (global_class, "class")
			Result.force (global_style, "style")
		ensure then
			count: Result.count >= Default_capacity
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

	tag_name: STRING
			-- `tag_name' for `html_out' of Current {RP_HTML_TAG}.
		deferred
		end

feature {NONE} -- Implementation

	html_content: like html_out
			-- `html_content' that goes into `html_out' between `start_tag' and `end_tag'.
		deferred
		end

feature {NONE} -- Implementation: Constants

	start_tag: STRING once ("object") Result := "<" + tag_name + tag_attributes_tag + ">" end

	end_tag: STRING once ("object")  Result := "</" + tag_name + ">" end

	tag_attributes_tag: STRING = "<<TAG_ATTRIBUTES>>"

	attribute_separator: STRING = "  "

	Default_capacity: INTEGER
		once ("object") Result := 3 end

end

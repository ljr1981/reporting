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
		redefine
			html_out
		end

feature -- Output

	html_out: STRING
			-- <Precursor>
			-- Add notion of `doctype' and other "<head>" items.
		do
			Result := doctype.twin
			-- <head> gets appended here ...
			Result.append_string (Precursor)
		end

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {RP_HTML_PAGE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "html"

feature {NONE} -- Implementation

	doctype: STRING = "<!DOCTYPE html>"
			-- `doctype' for HTML-5 (not 4.x or XML or other).
			-- This may (later on) need to be a class.

;note
	design: "[
Tag    Description
<head>    Defines information about the document
<title>    Defines the title of a document
<base>    Defines a default address or a default target for all links on a page
<link>    Defines the relationship between a document and an external resource
<meta>    Defines metadata about an HTML document
<script>    Defines a client-side script
<style>    Defines style information for a document
		]"
	EIS: "name=doctype", "src=http://www.w3schools.com/tags/tag_doctype.asp"
	EIS: "name=head", "src=http://www.w3schools.com/tags/tag_head.asp"
	EIS: "name=title", "src=http://www.w3schools.com/tags/tag_title.asp"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_base.asp"
	EIS: "name=link", "src=http://www.w3schools.com/tags/tag_link.asp"
	EIS: "name=meta", "src=http://www.w3schools.com/tags/tag_meta.asp"
	EIS: "name=script", "src=http://www.w3schools.com/tags/tag_script.asp"
	EIS: "name=style", "src=http://www.w3schools.com/tags/tag_style.asp"

end

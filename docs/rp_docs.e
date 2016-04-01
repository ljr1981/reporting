note
	description: "[
		Abstract notion of {RP_DOCS}.
		]"
	EIS: "src=http://960.gs"
	EIS: "src=http://1200px.com/"

deferred class
	RP_DOCS

feature -- In-system

	randomizer: detachable RANDOMIZER
			-- Bring `randomizer' in-system.

;note
	design: "[
		FROM CRYSTAL
		============
		Section 1 (Report Header)
		Section 2 (Page Header)
		GroupHeaderSection 1 (Group Header)

		Report (Header/Footer)
		Page (Header/Footer)
		Section (Header/Footer)
		Group (Header/Footer)
		Details (Header/Footer)

		Column (or Span?)

		NOTE: Take Section/Group/Details and put them in the 960.gs or 1200.gs and see what you get logically. I think what this means is the report can have parts that exist horizontally on a columnar system as well as vertical breaks, like pages, sections, groups, and details normally do.

		The Details section can the the <table/> (see http://www.w3schools.com/html/html_tables.asp)

		HOW EQUAL TO HTML?
		==================
		
		Report = Web Page (or multiple pages?)
		Page =
		]"
	wkhtmltopdf: "[
		Using wkhtmltopdf allows us to process generated HTML into a PDF and then deliver the PDF or print it.
		Pagination is pretty simple. Give wkhtmltopdf --header-*/footer-* and build with tags like <table/>
		and then use CSS to: page-break-inside:avoid attached to a "table" declaration
		
		When linked to the table declaration in the CSS (<style>) will (help)
		prevent tables spanning over page-breaks.
		]"
	EIS: "src=http://wkhtmltopdf.org/"
	EIS: "src=http://stackoverflow.com/questions/13516534/how-to-avoid-page-break-inside-table-row-for-wkhtmltopdf"
	EIS: "src=https://www.sitepoint.com/community/t/creating-page-breaks-in-wkhtmltopdf/38929"

	goal: "[
		Generate a simple report of made-up addresses into HTML/CSS and then hand-off to wkhtmltopdf -> PDF.
		]"

end

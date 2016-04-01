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
		
		DONE: address_list.pdf is now generated from address_list.csv
		]"
	goal: "[
		Create an RP_TABLE class, which produces <table> .. </table> HTML with provided data. This will replace
		the hacked together table of the address_list_test (above).
		]"
	goal: "[
		Create an RP_DATA class, which represents the data that will be given to something like RP_TABLE.
		We might give RP_DATA to an RP_REPORT, which walks over the items in RP_DATA, placing them in as
		many RP_TABLE items as are needed to process all RP_DATA in RP_REPORT.
		
		(1) Grouping: We want data to be grouped, subgrouped, etc based on various columns.
					The real question is: How do we ID fields upon which to group?
		(2) Calcs: Various on-the-fly calculations
			(a) Sum - Total/Running
			(b) Average - Total/Running
			(c) Count - Total/Running
			
		(3) Agents: Perhaps we want agent-visitors to walk the data first, populating each item with
					data like running (accumulating) sum, running average, and count?
		(4) Calc-able: Any column field that can be "added" can potentially benefit from being calc-able.
					At a minimum, we do NUMERIC.
		(5) Data-import: How does the data come to the class?
			(a) CSV
			(b) Flat-file
		(6) Sub-RP_DATA: If we have subordinate data in D' to D, where D = RP_DATA, how do we walk the data?
					Moreover, how do we group/subgroup and keep track of sum, average, count, and so on?
		]"

end

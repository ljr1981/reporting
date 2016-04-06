note
	description: "[
		Representation of an {RP_DATA_TABLE}.
		]"
	design: "[
		See class notes at the end of the class.
		]"

class
	RP_DATA_TABLE [G -> RP_DATA_ELEMENT create make_with_data end]

inherit
	RP_ANY

	HTML_TABLE
		rename
			documentation as html_documentation
		undefine
			default_create,
			out
		redefine
			html_content
		end

create
	make_with_data

feature {NONE} -- Initialization

	make_with_data (a_data: ARRAY [TUPLE]; a_header: like header)
			-- `make_with_data' in `a_data' and possible `a_header'.
		do
			across
				a_data as ic_tuple
			loop
				table_data.force (create {G}.make_with_data (ic_tuple.item, a_header))
			end
			header := a_header
		ensure
			set_data: table_data.count = a_data.count
			set_header: header ~ a_header
		end

feature -- Access

	table_data: ARRAYED_LIST [G]
			-- `table_data' of Current {RP_DATA_TABLE}.
		attribute
			create Result.make (Table_default_capacity)
		end

	header: RP_DATA_HEADER
			-- `header' for `table_data' of Current {RP_DATA_TABLE}.

feature {NONE} -- Implementation

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {RP_DATA_TABLE}.
		do
			create Result.make_empty

				-- table header goes here ...
			if not header.items.is_empty then
				Result.append_string ("<tr>")
				across
					header.items as ic
				loop
					Result.append_string ("<th>")
					check has_header_string: attached {STRING} ic.item as al_item then
						Result.append_string (al_item)
					end
					Result.append_string ("</th>")
				end
				Result.append_string ("</tr>")
			end

				-- table data goes here ...
			if not table_data.is_empty then
				across
					table_data as ic_data
				loop
					Result.append_string ("<tr>")
					check attached {G} ic_data.item as al_data_item and then attached {TUPLE} al_data_item.items as al_tuple_items then
						across
							al_tuple_items as ic_rows
						loop
							check iterable_tuple_data: attached {ITERABLE [ANY]} ic_rows.item as al_rows_item then
								Result.append_string ("<td>")
								Result.append_string (al_rows_item.out)
								Result.append_string ("</td>")
							end
						end
					end
					Result.append_string ("</tr>")
				end
			end
		end

feature {NONE} -- Implementation: Constants

	Table_default_capacity: INTEGER = 1_000
			-- `Table_default_capacity' for `table_data'.

;note
	design: "[
		An {RP_DATA_TABLE} represents a collection of {RP_DATA_ELEMENTS} with
		an {RP_DATA_HEADER}, which can then be emitted as some form of tabular
		data presentation (e.g. HTML/CSS).
		
		Options
		=======
		The options are based on the <table> HTML tag.
		
		HTML Tables
		===========

		Elements
		--------
		Use the HTML <table> 		element to define a table
		Use the HTML <tr> 			element to define a table row
		Use the HTML <td> 			element to define a table data
		Use the HTML <th> 			element to define a table heading
		Use the HTML <caption> 		element to define a table caption
		
		Properties
		----------
		Use the CSS border 			property to define a border
		Use the CSS border-collapse property to collapse cell borders
		Use the CSS padding 		property to add padding to cells
		Use the CSS text-align 		property to align cell text
		Use the CSS border-spacing 	property to set the spacing between cells

		Attributes
		----------		
		Use the colspan 			attribute to make a cell span many columns
		Use the rowspan 			attribute to make a cell span many rows
		Use the id 					attribute to uniquely define one table
		]"
	EIS: "src=http://www.w3schools.com/html/html_tables.asp"
	EIS: "src=http://www.w3schools.com/tags/tag_table.asp"
	EIS: "src=http://www.w3schools.com/tags/ref_standardattributes.asp"

end

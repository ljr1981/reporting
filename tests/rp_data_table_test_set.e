note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	RP_DATA_TABLE_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

feature -- Test routines

	rp_data_table_basic_tests
			-- `rp_data_table_basic_tests'
		local
			l_page: HTML_PAGE
			l_head: HTML_HEAD
			l_style: HTML_STYLE
			l_table: RP_DATA_TABLE [MOCK_DATA_ITEM]
		do

			create l_table.make_with_data (<<["2707", "AIMAR", "AVE", "SAVANNAH", "GA", "31406"], ["2709", "AIMAR", "AVE", "SAVANNAH", "GA", "31406"]>>, create {MOCK_DATA_HEADER})

			assert_strings_equal ("two_addresses_table", two_addresses_table, l_table.html_out)

			l_table.style_rule.border.attr_value := "1px solid black"
			l_table.style_rule.border_collapse.attr_value := "collapse"
			l_table.style_rule.page_break_inside.attr_value := "avoid"

			create l_page
			create l_head
			create l_style.make_with_content (<<create {HTML_TEXT}.make_with_text (l_table.style_out)>>)

			l_page.set_head (l_head)
			l_head.set_style (l_style)
			l_page.add_content (l_table)

			assert_strings_equal ("two_addresses_page_with_style", two_addresses_page_with_style, l_page.html_out)
		end

	address_report_tests_2
			-- `address_report_tests_2'
		local
			l_page: HTML_PAGE
			l_head: HTML_HEAD
			l_style: HTML_STYLE
			l_table: RP_DATA_TABLE [MOCK_DATA_ITEM]

			l_file: PLAIN_TEXT_FILE
		do

			create l_table.make_with_data (randomizer.random_addresses_as_array (900 |..| 1_000), create {MOCK_DATA_HEADER})

			l_table.style_rule.selectors.force ("table, th, td")
			l_table.style_rule.border.attr_value := "1px solid black"
			l_table.style_rule.border_collapse.attr_value := "collapse"
			l_table.style_rule.page_break_inside.attr_value := "avoid"

			create l_page
			create l_head
			create l_style.make_with_content (<<create {HTML_TEXT}.make_with_text (l_table.style_out)>>)

			l_page.set_head (l_head)
			l_head.set_style (l_style)
			l_page.add_content (l_table)

			create l_file.make_create_read_write ("address_list_2.html")
			l_file.put_string (l_page.html_out)
			l_file.close
		end

feature {NONE} -- Support

	two_addresses_table: STRING = "<table><tr><th>Number</th><th>Name</th><th>Suffix</th><th>City</th><th>State</th><th>ZIP</th></tr><tr><td>2707</td><td>AIMAR</td><td>AVE</td><td>SAVANNAH</td><td>GA</td><td>31406</td></tr><tr><td>2709</td><td>AIMAR</td><td>AVE</td><td>SAVANNAH</td><td>GA</td><td>31406</td></tr></table>"

	two_addresses_page_with_style: STRING = "<!DOCTYPE html><html><head><style>{border:1px solid black; border-collapse:collapse; page-break-inside:avoid;}</style></head><body><table><tr><th>Number</th><th>Name</th><th>Suffix</th><th>City</th><th>State</th><th>ZIP</th></tr><tr><td>2707</td><td>AIMAR</td><td>AVE</td><td>SAVANNAH</td><td>GA</td><td>31406</td></tr><tr><td>2709</td><td>AIMAR</td><td>AVE</td><td>SAVANNAH</td><td>GA</td><td>31406</td></tr></table></body></html>"

feature -- Test routines

	address_report_test
			-- `address_report_test'
		local
			l_html,
			l_tables,
			l_table,
			l_rows: STRING
			l_list: READABLE_INDEXABLE [TUPLE [street,name,suffix,city,state,zip: STRING]]
			l_alt_list: ARRAYED_LIST [TUPLE [street,name,suffix,city,state,zip: STRING]]
			l_file: PLAIN_TEXT_FILE
			l_dir: DIRECTORY
			l_path: PATH
			l_csv_list,
			l_csv_line: LIST [STRING]
		do
			l_html := html_fragment.twin
			create l_tables.make_empty
			create l_table.make_empty
			create l_rows.make_empty
			create l_path.make_from_string ("address_list.csv")
			create l_dir.make_with_path (l_path)
			create l_file.make_open_read (l_path.name.out)
			l_file.read_stream (l_file.count)
			if not l_file.last_string.is_empty then
				l_csv_list := l_file.last_string.split ('%N')
			else
				l_csv_list := ("").split ('%N')
			end
			l_file.close
			if l_csv_list.count > 1 then
				create l_alt_list.make (l_csv_list.count)
				across
					l_csv_list as ic_csv
				loop
					l_csv_line := ic_csv.item.split (',')
					if l_csv_line.count >= 6 then
						l_alt_list.force ([l_csv_line [1], l_csv_line [2], l_csv_line [3], l_csv_line [4], l_csv_line [5], l_csv_line [6]])
					end
				end
				l_list := l_alt_list
			else
				check where_is_csv_file: False end
				l_list := randomizer.random_address_hash.twin
			end
			across
				l_list as ic
			loop
				if (ic.cursor_index \\ 35) = 0 then
					l_table.replace_substring_all ("<<TABLE_ROWS>>", l_rows)
					l_tables.append_string_general (l_table)
					l_tables.append_character ('%N')
					l_table := table_fragment.twin
					l_table.replace_substring_all ("<<TABLE_HEADER>>", "<tr><th>Number</th><th>Name</th><th>Suffix</th><th>City</th><th>State</th><th>ZIP</th></tr>")
					create l_rows.make_empty
				end
				l_rows.append_string_general ("<tr>")
				l_rows.append_string_general ("<td>" + ic.item.street + "</td>%N")
				l_rows.append_string_general ("<td>" + ic.item.name + "</td>%N")
				l_rows.append_string_general ("<td>" + ic.item.suffix + "</td>%N")
				l_rows.append_string_general ("<td>" + ic.item.city + "</td>%N")
				l_rows.append_string_general ("<td>" + ic.item.state + "</td>%N")
				l_rows.append_string_general ("<td>" + ic.item.zip + "</td>%N")
				l_rows.append_string_general ("</tr>")
				l_rows.append_character ('%N')
			end
			l_html.replace_substring_all ("<<REPORT_BODY>>", l_tables)
			create l_file.make_create_read_write ("address_list.html")
			l_file.put_string (l_html)
			l_file.close

--			create l_file.make_create_read_write ("address_list.csv")
--			across
--				l_list as ic
--			loop
--				l_file.put_string (ic.item.street); l_file.put_character (',')
--				l_file.put_string (ic.item.name); l_file.put_character (',')
--				l_file.put_string (ic.item.suffix); l_file.put_character (',')
--				l_file.put_string (ic.item.city); l_file.put_character (',')
--				l_file.put_string (ic.item.state); l_file.put_character (',')
--				l_file.put_string (ic.item.zip); l_file.put_character ('%N')
--			end
--			l_file.close
		end

feature {NONE} -- Implementation

	html_fragment: STRING = "[
<!DOCTYPE html>
<html>
	<head>
		<style>
			table, th, td {
			    border: 1px solid black;
			    border-collapse: collapse;
			    page-break-inside:avoid;
			}
			th, td {
			    padding: 5px;
			    text-align: left;    
			}
		</style>
	</head>
<body>
<<REPORT_BODY>>
	</body>
</html>
]"

	table_fragment: STRING = "[
<table>
<<TABLE_HEADER>>
<<TABLE_ROWS>>
</table>
]"

feature {NONE} -- Implementation

	randomizer: RANDOMIZER once create Result end

end



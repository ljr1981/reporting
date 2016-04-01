note
	description: "Tests of {REPORTING}."
	testing: "type/manual"

class
	REPORTING_TEST_SET

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

	reporting_tests
			-- `reporting_tests'
		local
			l_docs: RP_DOCS
		do
			do_nothing -- yet ...
		end

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
			create l_file.make_create_read_write (l_path.name.out)
			if l_file.count > 0 then
				l_file.read_stream (l_file.count)
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

			create l_file.make_create_read_write ("address_list.csv")
			across
				l_list as ic
			loop
				l_file.put_string (ic.item.street); l_file.put_character (',')
				l_file.put_string (ic.item.name); l_file.put_character (',')
				l_file.put_string (ic.item.suffix); l_file.put_character (',')
				l_file.put_string (ic.item.city); l_file.put_character (',')
				l_file.put_string (ic.item.state); l_file.put_character (',')
				l_file.put_string (ic.item.zip); l_file.put_character ('%N')
			end
			l_file.close
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

	randomizer: RANDOMIZER once create Result end

end

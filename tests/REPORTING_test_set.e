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
			l_list: like randomizer.random_address_hash
			l_file: PLAIN_TEXT_FILE
		do
			l_html := html_fragment.twin
			l_list := randomizer.random_address_hash.twin
			create l_tables.make_empty
			create l_table.make_empty
			create l_rows.make_empty
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

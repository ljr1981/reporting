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

	REPORTING_tests
			-- `REPORTING_tests'
		do
			do_nothing -- yet ...
		end

end

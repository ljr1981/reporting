note
	description: "[
		Abstract notion of a {RP_DATA_HEADER}.
		]"
	design: "[
		See end-of-class notes.
		]"

deferred class
	RP_DATA_HEADER

feature -- Access

	items: ARRAY [STRING]
			-- `headers' of Current {RP_DATA_HEADER}.
		deferred
		end

;note
	design: "[
		Each collection of {RP_DATA_ELEMENT} items may have header information.
		]"

end

note
	description: "[
		Abstract notion of an {RP_DATA_ELEMENT}.
		]"
	design: "[
		See end-of-class notes.
		]"

deferred class
	RP_DATA_ELEMENT

inherit
	RP_ANY
	
feature {NONE} -- Initialization

	make_with_data (a_data: attached like items_type_anchor; a_header: like header)
			-- `make_with_data' in `a_data' and possible `a_header'.
		do
			internal_items := a_data
			header := a_header
		ensure
			set_data: internal_items ~ a_data
			set_header: header ~ a_header
		end

feature -- Access

	items: attached like items_type_anchor
			-- `items' of Current {RP_DATA_ELEMENT}.
		do
			check has_items: attached internal_items as al_items then Result := al_items end
		end

	sub_elements: ARRAYED_LIST [RP_DATA_ELEMENT]
			-- `sub_elements' of Current {RP_DATA_ELEMENT}.
		attribute
			create Result.make (Default_capacity)
		end

feature -- Access

	items_type_anchor: detachable TUPLE
			-- `items_type_anchor' for `items' and `internal_items'.
			-- This feature can be referenced, but not accessed (i.e. breaks require contract below).
		require
			do_not_access: False
		deferred
		end

	header: detachable RP_DATA_HEADER
			-- Optional `header' of Current {RP_DATA_ELEMENT}.

feature {NONE} -- Implementation

	internal_items: detachable like items_type_anchor
			-- `internal_items' of Current {RP_DATA_ELEMENT}.

feature {NONE} -- Implementation: Constants

	Default_capacity: INTEGER = 100

invariant
	matching_header: attached header as al_header implies al_header.items.count = items.count

note
	design: "[
		Within a collection of data items, there are single items. This single item
		is the notion of an {RP_DATA_ELEMENT}. Moreover, an {RP_DATA_ELEMENT} can have one
		or more subordinate {RP_DATA_ELEMENT} items.
		]"

end

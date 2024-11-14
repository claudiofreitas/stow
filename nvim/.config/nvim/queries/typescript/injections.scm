; extends

(call_expression
  function: (member_expression
    object: (identifier) @client (#eq? @client "sqlClient")
    property: (property_identifier) @property_identifier (#eq? @property_identifier "query")
  )
  arguments: (arguments
    (template_string
			(string_fragment) @sql @injection.content
			(#set! injection.language "sql")
			(#set! injection.include-children)
		) 
  )
)


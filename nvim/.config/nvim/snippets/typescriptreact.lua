local luasnip = require('luasnip')

local snippet = luasnip.s
local ins_node = luasnip.i
-- local text_node = luasnip.t
-- local dynamic_node = luasnip.dynamic_node
-- local choice_node = luasnip.choice_node
-- local function_node = luasnip.function_node
-- local snippet_node = luasnip.snippet_node

local format = require('luasnip.extras.fmt').fmt
local rep_node = require('luasnip.extras').rep

local snippets, autosnippets = {}, {}

local function create_snippet(context, nodes, opts)
	local new_snippet = snippet(context, nodes, opts)
	table.insert(snippets, new_snippet)
end

create_snippet(
	{
		trig = 'FC (React Functional Component)',
		name = 'React Functional Component',
		dscr = 'Expands to a React functional component declaration',
	},
	format(
		[[
interface Props extends ComponentProps<{}> {{}}

const {}: FC<Props> = () => {{
  return (
    <></>
  );
}};

export {{ {} }};
]],
		{
			ins_node(1, 'typeof InnerComponent'),
			ins_node(2, 'ComponentName'),
			rep_node(2),
		}
	)
)

create_snippet(
	{
		trig = "it('should",
		name = "Jest it('should ...') block",
		dscr = 'Expands to a Jest it case scenario',
	},
	format(
		[[
it('should TODO', async () => {{
  {}
}});
]],
		{
			ins_node(0),
		}
	)
)

create_snippet(
	{
		trig = 'beforeEach()',
		name = 'Jest beforeEach() block',
		dscr = 'Expands to a Jest beforeEach block',
	},
	format(
		[[
beforeEach(() => {{
  {}
}});
]],
		{
			ins_node(0),
		}
	)
)

create_snippet(
	{
		trig = 'jest.mock()',
		name = 'Jest mock() block',
		dscr = 'Expands to a Jest mock block',
	},
	format(
		[[
jest.mock("{}", () => ({{
  {}: jest.fn(),
}}));
]],
		{
			ins_node(1, 'module'),
			ins_node(2, 'exportedFunction'),
		}
	)
)

return snippets, autosnippets

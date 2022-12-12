-- Tree Sitter Configuration
-- https://github.com/nvim-treesitter/nvim-treesitter#modules

-- Each key inside the table is a module

require('nvim-treesitter.configs').setup({
	ensure_installed = 'all', -- either "all" or a list of languages
	ignore_install = {}, -- List of parsers to ignore installing

	-- Highlight settings
	highlight = {
		enable = true, -- false will disable the whole module
	},

	-- Playground
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	},

	autotag = {
		enable = true,
	},

	-- Enable treesitter module to set the comment string based on the position of the cursor inside the file
	-- Provided by https://github.com/JoosepAlviste/nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

	-- Indent (experimental) https://github.com/nvim-treesitter/nvim-treesitter#indentation
	--indent = {
	--  enable = true
	--},
})

-- Tree Sitter Configuration
-- https://github.com/nvim-treesitter/nvim-treesitter#modules

-- Each key inside the table is a module

local ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
	print('error on trying to load nvim-treesitter')
	return nil
end

treesitter_configs.setup({
	ensure_installed = { -- either "all" or a list of languages
		'bash',
		'c',
		'css',
		'diff',
		'dockerfile',
		'git_config',
		'git_rebase',
		'gitattributes',
		'gitcommit',
		'gitignore',
		'graphql',
		'html',
		'http',
		'javascript',
		'jq',
		'jsdoc',
		'json',
		'json5',
		'jsonc',
		'latex',
		'lua',
		'luadoc',
		'make',
		'markdown',
		'markdown_inline',
		'mermaid',
		'ninja',
		'nix',
		'objc',
		'perl',
		'php',
		'prisma',
		'puppet',
		'python',
		'query', -- tree-sitter query language
		'r',
		'regex',
		'ruby',
		'rust',
		'scss',
		'sql',
		'terraform',
		'toml',
		'tsx',
		'typescript',
		'vim',
		'vimdoc',
		'vue',
		'yaml',
	},
	ignore_install = {}, -- List of parsers to ignore installing
	sync_install = false, -- false for async
	auto_install = true,

	-- Highlight settings
	highlight = {
		enable = true, -- false will disable the whole module

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
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

local autoload_packages = {
	'options',

	-- 'plugins',
	'setup-lazy',
	'setup-treesitter',
	'setup-telescope',

	-- 'setup-lspconfig',
	'setup-lspzero',
	'setup-gitsigns',
	'setup-luasnip',
	'setup-cmp',
	'setup-lspsaga',
	'setup-lualine',
	-- 'setup-nullls',
	'setup-fidget',
	'setup-notify',
	'setup-bufferline',
	'setup-colorcolumn',
	'setup-neovide',
	'keymaps',
}

for _, package_name in ipairs(autoload_packages) do
	require(package_name)
end

-- Refresh
Reload_all_requires = function()
	for _, package_name in ipairs(autoload_packages) do
		package.loaded[package_name] = nil
	end
	vim.api.nvim_command([[source ~/.config/nvim/init.lua]])
	print('nvim config reloaded')
end

vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua Reload_all_requires()<CR>', {})

--> [[ Setup Theme ]]
-- vim.api.nvim_command('colorscheme claudio-darker')
-- vim.api.nvim_command('colorscheme kikwis')
-- require('setup-colorscheme-tokyonight')
-- require('setup-colorscheme-sonokai')
-- require('setup-colorscheme-catppuccin')
-- vim.api.nvim_command('colorscheme rose-pine')

local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})

vim.api.nvim_create_autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 120,
		})
	end,
})

-- local my_group = vim.api.nvim_create_augroup('mygroup', { clear = true })
-- vim.api.nvim_create_autocmd(
--   'InsertLeave',
--   {
--     -- command = "echo 'Hello'",
--     callback = function ()
--       -- print 'hi 1'
--       -- print 'hi 2'
--       vim.cmd('w')
--     end,
--     group = my_group,
--   }
-- )

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- Use a sharp border with `FloatBorder` highlights
	border = 'single',
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 16,
		source = true,
	},
	float = {
		source = true,
	},
})

vim.api.nvim_exec(
	[[
  sign define DiagnosticSignError text= linehl= numhl= texthl=DiagnosticSignError
  sign define DiagnosticSignWarn  text= linehl= numhl= texthl=DiagnosticSignWarn
  sign define DiagnosticSignInfo  text= linehl= numhl= texthl=DiagnosticSignInfo
  sign define DiagnosticSignHint  text= linehl= numhl= texthl=DiagnosticSignHint
]],
	false
)

local autopairs_ok, autopairs = pcall(require, 'nvim-autopairs')
if not autopairs_ok then
	print('error on trying to load nvim-autopairs')
else
	autopairs.setup({})
end

local blankline_ok, blankline = pcall(require, 'indent_blankline')
if not blankline_ok then
	print('error on trying to load indent_blankline')
else
	vim.cmd([[highlight IndentBlanklineChar guifg=#474747 gui=nocombine]])
	blankline.setup({
		char = '│',
		char_blankline = '│',

		-- char_blankline = '',
		-- char_list = { '1', '2' },
		-- char_list_blankline = { '3', '4' },
		-- char_highlight_list = {'Error', 'Function'},
		-- char_highlight_list = {
		-- 	'IndentBlanklineIndent1',
		-- 	'IndentBlanklineIndent2',
		-- },
		-- space_char_blankline = ' ',
		-- space_char_highlight_list = {
		-- 	'',
		-- },
		-- space_char_blankline_highlight_list = {
		-- 	'',
		-- },

		-- use_treesitter = false,
		-- indent_level = 10,
		-- max_indent_increase = 10,
		-- show_first_indent_level = true,
		show_trailing_blankline_indent = false,
		-- show_end_of_line = false,
		-- show_foldtext = true,
		-- enabled = true,
		-- disable_with_nolist = false,
		-- filetype = {}, -- enabled for all filetypes
		filetype_exclude = {
			'help',
			'alpha',
			'dashboard',
			'neo-tree',
			'Trouble',
			'lazy',
			'mason',
			'notify',
			'toggleterm',
			'lazyterm',
		},
		-- buftype_exclude = {},
		-- strict_tabs = {},
		show_current_context = false,
		-- show_current_context_start = false, -- requires treesitter
		-- show_current_context_start_on_current_line = true, -- requires treesitter
		-- context_char = 'L',
		-- context_char_blankline = '*',
		-- context_char_list = {},
		-- context_char_list_blankline = {},
		-- context_highlight_list = {},
		-- char_priority = 1,
		-- context_patterns = {}, -- only when show_current_context is true
		-- use_treesitter_scope = false,
		-- context_pattern_highlight = {},
		-- viewport_buffer = 10,
		-- disable_warning_message = false,
	})
end

local comment_ok, comment = pcall(require, 'Comment')
if not comment_ok then
	print('error on trying to load Comment')
else
	local ts_context_commentstring_ok, ts_context_commentstring =
		pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
	if not ts_context_commentstring_ok then
		print('error on trying to load ts_context_commentstring')
	else
		comment.setup({
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end
end

-- Fix indent behavior on yaml files
vim.cmd([[
    filetype plugin indent on
    augroup FixIndentYaml
        autocmd!
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab indentkeys-=0# indentkeys-=<:> indentkeys-=0-
    augroup END
]])

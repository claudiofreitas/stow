local autoload_packages = {
	'options',
	'plugins',
	'setup-treesitter',
	'setup-telescope',
	'setup-lspconfig',
	'setup-gitsigns',
	'setup-luasnip',
	'setup-cmp',
	'setup-lspsaga',
	'setup-lualine',
	'setup-nullls',
	'setup-fidget',
	'setup-notify',
	'setup-bufferline',
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
require('setup-colorscheme-material')
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

require('nvim-tree').setup({})
vim.api.nvim_set_keymap('n', '<leader>1', '<cmd>NvimTreeToggle<cr>', {})

require('nvim-autopairs').setup({})

vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]])
require('indent_blankline').setup({
	space_char_blankline = ' ',
	-- char = '',
	-- char_highlight_list = {
	-- 	'IndentBlanklineIndent1',
	-- 	'IndentBlanklineIndent2',
	-- },
	-- space_char_highlight_list = {
	-- 	'IndentBlanklineIndent1',
	-- 	'IndentBlanklineIndent2',
	-- },
	-- show_trailing_blankline_indent = false,
	-- show_current_context = true,
	-- show_current_context_start = true,
})

-- Fix indent behavior on yaml files
vim.cmd([[
    filetype plugin indent on
    augroup FixIndentYaml
        autocmd!
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab indentkeys-=0# indentkeys-=<:> indentkeys-=0-
    augroup END
]])

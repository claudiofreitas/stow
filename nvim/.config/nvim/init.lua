local autoload_packages = {
	'options',

	-- 'plugins',
	'setup-lazy',
	'setup-treesitter',
	'setup-telescope',

	'setup-lspzero',
	'setup-gitsigns',
	'setup-luasnip',
	'setup-cmp',
	'setup-lspsaga',
	'setup-lualine',
	-- 'setup-nullls',
	'setup-fidget',
	'setup-notify',
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

-- Fix indent behavior on yaml files
vim.cmd([[
    filetype plugin indent on
    augroup FixIndentYaml
        autocmd!
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab indentkeys-=0# indentkeys-=<:> indentkeys-=0-
    augroup END
]])

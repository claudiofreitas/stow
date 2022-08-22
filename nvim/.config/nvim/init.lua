require('options')
require('plugins')
require('setup-treesitter')
require('setup-telescope')
require('setup-lspconfig')
require('setup-gitsigns')
require('setup-cmp')
require('setup-lspsaga')
require('setup-lualine')
require('setup-nullls')
require('keymaps')

-- Refresh
Reload_all_requires = function()
	package.loaded['options'] = nil
	package.loaded['plugins'] = nil
	package.loaded['setup-treesitter'] = nil
	package.loaded['setup-telescope'] = nil
	package.loaded['setup-lspconfig'] = nil
	package.loaded['setup-gitsigns'] = nil
	package.loaded['setup-cmp'] = nil
	package.loaded['setup-lspsaga'] = nil
	package.loaded['setup-lualine'] = nil
	package.loaded['keymaps'] = nil
	package.loaded['setup-nullls'] = nil
end
vim.api.nvim_set_keymap(
	'n',
	'<F5>',
	':lua Reload_all_requires()<CR>:source ~/.config/nvim/init.lua<CR>:echo "nvim config reloaded"<CR>',
	{}
)

--> [[ Setup Theme ]]
-- vim.api.nvim_command('colorscheme claudio-darker')
-- vim.api.nvim_command('colorscheme kikwis')
-- require('setup-colorscheme-material')
-- require('setup-colorscheme-tokyonight')
require('setup-colorscheme-sonokai')

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

-- Fix indent behavior on yaml files
vim.cmd([[
    filetype plugin indent on
    augroup FixIndentYaml
        autocmd!
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab indentkeys-=0# indentkeys-=<:> indentkeys-=0-
    augroup END
]])

require("options")
require("plugins")
require("setup-treesitter")
require("setup-telescope")
require("setup-lspconfig")
require("setup-gitsigns")
require("setup-cmp")
require("setup-lspsaga")
require("keymaps")

-- Refresh
Reload_all_requires = function()
  package.loaded["options"] = nil
  package.loaded["plugins"] = nil
  package.loaded["setup-treesitter"] = nil
  package.loaded["setup-telescope"] = nil
  package.loaded["setup-lspconfig"] = nil
  package.loaded["setup-gitsigns"] = nil
  package.loaded["setup-lspsaga"] = nil
  package.loaded["setup-cmp"] = nil
  package.loaded["keymaps"] = nil
end
vim.api.nvim_set_keymap("n", "<F5>", ":lua Reload_all_requires()<CR>:source ~/.config/nvim/init.lua<CR>:echo \"nvim config reloaded\"<CR>", {})

-- Setup Theme
-- vim.api.nvim_command('colorscheme claudio-darker')

vim.g.material_style = 'darker'
require('material').setup({
  high_visibility = {
		lighter = false,
		darker = true,
	},

  disable = {
    colored_cursor = true,
    background = false,
  },
})
vim.api.nvim_command('colorscheme material')


-- vim.api.nvim_command('colorscheme tokyonight')
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'None' })
-- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'None' })
-- vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'None' })
-- vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#555555', ctermbg = 0 })
-- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#5eacd3' })
-- vim.api.nvim_set_hl(0, 'netrwDir', { fg = '#5eacd3' })




---vim.api.nvim_command('colorscheme kikwis')





vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single",
  }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 16,
    }
  }
)

vim.api.nvim_exec([[
  sign define DiagnosticSignError text= linehl= numhl= texthl=DiagnosticSignError
  sign define DiagnosticSignWarn  text= linehl= numhl= texthl=DiagnosticSignWarn
  sign define DiagnosticSignInfo  text= linehl= numhl= texthl=DiagnosticSignInfo
  sign define DiagnosticSignHint  text= linehl= numhl= texthl=DiagnosticSignHint
]], false)



-- Fix indent behavior on yaml files
vim.cmd([[
    filetype plugin indent on
    augroup FixIndentYaml
        autocmd!
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab indentkeys-=0# indentkeys-=<:> indentkeys-=0-
    augroup END
]])


require("options")
require("plugins")
require("setup-treesitter")
require("setup-telescope")
require("setup-lspconfig")
require("keymaps")

-- Refresh
Reload_all_requires = function()
  package.loaded["options"] = nil
  package.loaded["plugins"] = nil
  package.loaded["setup-treesitter"] = nil
  package.loaded["setup-telescope"] = nil
  package.loaded["setup-lspconfig"] = nil
  package.loaded["keymaps"] = nil
end
vim.api.nvim_set_keymap("n", "<F5>", ":lua Reload_all_requires()<CR>:source ~/.config/nvim/lua/init.lua<CR>:echo \"nvim config reloaded\"<CR>", {})

-- Setup Theme
-- vim.api.nvim_command('colorscheme claudio-darker')
vim.api.nvim_command('colorscheme kikwis')





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
  sign define DiagnosticSignWarn  text= linehl= numhl= texthl=DiagnosticSignWarn
  sign define DiagnosticSignInfo  text= linehl= numhl= texthl=DiagnosticSignInfo
  sign define DiagnosticSignHint  text= linehl= numhl= texthl=DiagnosticSignHint
  sign define DiagnosticSignError text= linehl= numhl= texthl=DiagnosticSignError
]], false)









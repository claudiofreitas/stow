require("options")
require("plugins")
require("setup-treesitter")
require("setup-telescope")
require("keymaps")

-- Refresh
Reload_all_requires = function()
  package.loaded.options = nil
  package.loaded.plugins = nil
  package.loaded["setup-treesitter"] = nil
  package.loaded["setup-telescope"] = nil
  package.loaded.keymaps = nil
end
vim.api.nvim_set_keymap("n", "<F5>", ":lua Reload_all_requires()<CR>:source ~/.config/nvim/lua/init.lua<CR>:echo \"nvim config reloaded\"<CR>", {})


vim.api.nvim_exec('source ~/.config/nvim/bla.vim', nil)

-- Setup Theme
-- vim.api.nvim_command('colorscheme claudio-darker')
vim.api.nvim_command('colorscheme kikwis')

-- LSP
local lspconfig = require('lspconfig')
lspconfig.util.default_config = vim.tbl_extend (
  "force",
  lspconfig.util.default_config,
  { log_level = vim.lsp.protocol.MessageType.Error }
)
--lspconfig.tsserver.setup {
--  on_attach = require'completion'.on_attach
--}



-- Lua Language Server (sumneko)
local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    }
  }
}




-- Lua Language Server (tjdevries)

local custom_nvim_lspconfig_attach = function() end
require('nlua.lsp.nvim').setup(require('lspconfig'), {
  on_attach = custom_nvim_lspconfig_attach,
  globals = {
    "vim"
  }
})

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









local lspconfig = require('lspconfig')
lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  { log_level = vim.lsp.protocol.MessageType.Error }
)



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

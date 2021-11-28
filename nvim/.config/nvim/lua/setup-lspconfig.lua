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

lspconfig.sumneko_lua.setup({
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
})




-- Lua Language Server (tjdevries)
local custom_nvim_lspconfig_attach = function() end
require('nlua.lsp.nvim').setup(require('lspconfig'), {
  on_attach = custom_nvim_lspconfig_attach,
  globals = {
    "vim"
  }
})



lspconfig.tsserver.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
})


local on_attach = function(_, bufnr)
  local function local_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function local_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- https://github.com/neovim/nvim-lspconfig
  local_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  local_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  local_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  local_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  local_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  local_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  local_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  local_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers = { 'tsserver' }
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150, -- <- What does this do?
    }
  })
end




-- JSON (jsonls)

require('lspconfig').jsonls.setup({
})





print("loaded setup-lspconfig.lua")

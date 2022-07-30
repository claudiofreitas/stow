
-- Tree Sitter Configuration
require('nvim-treesitter.configs').setup ({
  ensure_installed = "all", -- either "all" or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing

  -- Highlight settings
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    custom_captures = {
      --["foo.bar"] = "Identifier",
    },
    additional_vim_regex_highlighting = true, -- true, false or list of languages (can cause some problems, check https://github.com/nvim-treesitter/nvim-treesitter#modules)
  },

  -- Incremental selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
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

  -- Indent
  indent = {
    enable = true
  },

})


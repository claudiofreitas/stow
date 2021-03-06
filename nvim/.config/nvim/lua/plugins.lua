
require('packer').startup(
  function(use)
    -- Packer
    use('wbthomason/packer.nvim')

    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    })

    use('nvim-treesitter/playground')

    -- Legend of Zelda theme
    use('lucastrvsn/kikwis')

    -- Sumneko in my repo:
    -- use('claudiofreitas/nlua.nvim')

    --" (OPTIONAL): If you want to use built-in LSP (requires Neovim HEAD)
    --"   Currently only supported LSP, but others could work in future if people send PRs :)
    use('neovim/nvim-lspconfig')

    --" (OPTIONAL): This is a suggested plugin to get better Lua syntax highlighting
    --"   but it's not currently required
    -- use 'euclidianAce/BetterLua.vim'

    --" (OPTIONAL): If you wish to have fancy lua folds, you can check this out.
    -- use 'tjdevries/manillua.nvim'

    use('nvim-lua/plenary.nvim')

    --use 'Th3Whit3Wolf/onebuddy'
    --use '~/.config/nvim/pack/claudiocolor'
    --use 'marko-cerovac/material.nvim'
    use('rktjmp/lush.nvim')
    use({
      '~/repos/claudio-darker.lua',
      -- config = "vim.cmd('colorscheme claudio-darker')",
    })

    -- Telescope
    use({
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    })

    use('kyazdani42/nvim-web-devicons')

    use('tpope/vim-fugitive')

    use({
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    })

    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')

    use({
      'ms-jpq/chadtree',
      branch = 'chad',
      run = {
        'python3 -m chadtree deps',
        ':CHADdeps',
      },
    })

  end
)


require('cmp').setup({})

-- require('cmp').setup({
--   enabled = true,
--   autocomplete = true,
--   debug = false,
--   min_length = 1,
--   preselect = "enable",
--   throttle_time = 80,
--   source_timeout = 200,
--   incomplete_delay = 400,
--   max_abbr_width = 100,
--   max_kind_width = 100,
--   max_menu_width = 100,
--   source = {
--     path = true,
--     buffer = true,
--     calc = true,
--     vsnip = true,
--     nvim_lsp = true,
--     nvim_lua = true,
--     spell = true,
--     tags = true,
--     snippets_nvim = true,
--     treesitter = true
--   }
-- })


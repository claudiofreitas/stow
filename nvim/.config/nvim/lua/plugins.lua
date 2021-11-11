
require('packer').startup(
  function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    use { 
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    }
        
    use 'nvim-treesitter/playground'

    -- Legend of Zelda theme
    use 'lucastrvsn/kikwis'

    -- Sumneko in my repo:
    use 'claudiofreitas/nlua.nvim'

    --" (OPTIONAL): If you want to use built-in LSP (requires Neovim HEAD)
    --"   Currently only supported LSP, but others could work in future if people send PRs :)
    use 'neovim/nvim-lspconfig'

    --" (OPTIONAL): This is a suggested plugin to get better Lua syntax highlighting
    --"   but it's not currently required
    -- use 'euclidianAce/BetterLua.vim'

    --" (OPTIONAL): If you wish to have fancy lua folds, you can check this out.
    -- use 'tjdevries/manillua.nvim'

    use 'nvim-lua/plenary.nvim'

    --use 'Th3Whit3Wolf/onebuddy'
    --use '~/.config/nvim/pack/claudiocolor'
    --use 'marko-cerovac/material.nvim'
    use 'rktjmp/lush.nvim'
    use '~/repos/claudio-darker.lua'
    
    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'kyazdani42/nvim-web-devicons'

    use 'tpope/vim-fugitive'

  end
)

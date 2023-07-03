require('packer').startup(function(use)
	-- Packer
	use('wbthomason/packer.nvim')

	use('~/repos/stackmap.nvim')

	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	})

	use('nvim-treesitter/playground')

	-- Color schemes
	use('lucastrvsn/kikwis')
	use('folke/tokyonight.nvim')
	use({
		'~/repos/claudio-darker.lua',
		-- config = "vim.cmd('colorscheme claudio-darker')",
	})
	use({
		'marko-cerovac/material.nvim',
		config = function()
			vim.g.material_style = 'darker'
		end,
	})
	use('sainnhe/sonokai')
	use('rose-pine/neovim')
	use('tiagovla/tokyodark.nvim')
	use('catppuccin/nvim')

	use({
		'nvim-lualine/lualine.nvim',
	})

	-- Sumneko in my repo:
	-- use('claudiofreitas/nlua.nvim')

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

	-- Telescope
	use({
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
	})
	use('nvim-telescope/telescope-ui-select.nvim')
	use({
		'nvim-telescope/telescope-file-browser.nvim',
	})

	use('kyazdani42/nvim-web-devicons')
	use('kyazdani42/nvim-tree.lua')

	use('tpope/vim-fugitive')

	use({
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
	})

	-- https://github.com/L3MON4D3/LuaSnip
	-- Demo: https://www.youtube.com/watch?v=Dn800rlPIho
	use('L3MON4D3/LuaSnip')

	use('hrsh7th/nvim-cmp')
	-- use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-nvim-lua')
	use('hrsh7th/cmp-path')
	-- use('hrsh7th/cmp-cmdline')

	use('saadparwaiz1/cmp_luasnip')

	use('onsails/lspkind.nvim')

	use('jose-elias-alvarez/null-ls.nvim')

	-- https://github.com/numToStr/Comment.nvim
	-- Demo: https://www.youtube.com/watch?v=-InmtHhk2qM
	use('numToStr/Comment.nvim')
	-- Enable treesitter module to set the comment string based on the position of the cursor inside the file
	use('JoosepAlviste/nvim-ts-context-commentstring')

	-- https://github.com/glepnir/lspsaga.nvim
	use({
		'glepnir/lspsaga.nvim',
		branch = 'main',
	})

	use({
		'j-hui/fidget.nvim',
		tag = 'legacy',
	})

	use('windwp/nvim-autopairs')

	use('windwp/nvim-ts-autotag')

	use('lukas-reineke/indent-blankline.nvim')

	use('rcarriga/nvim-notify')

	use('mattn/emmet-vim')

	use('mbbill/undotree')

	use({
		'akinsho/bufferline.nvim',
		-- tag = '*',
		requires = 'nvim-tree/nvim-web-devicons',
	})

	use('jose-elias-alvarez/typescript.nvim')

	use({
		'folke/which-key.nvim',
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require('which-key').setup({

				-- TODO: remove this setup from here
				-- Ref.: https://github.com/folke/which-key.nvim#-usage
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
			require('which-key').register({
				q = ':q',
			}, { prefix = '<leader>' })
		end,
	})
end)

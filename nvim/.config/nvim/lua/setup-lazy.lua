local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

	{ dir = '~/repos/stackmap.nvim' },

	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'nvim-treesitter/playground' },

	-- Color schemes
	{ 'lucastrvsn/kikwis' },
	{ 'folke/tokyonight.nvim' },
	{
		dir = '~/repos/claudio-darker.lua',
		-- config = "vim.cmd('colorscheme claudio-darker')",
	},
	{
		'marko-cerovac/material.nvim',
		config = function()
			vim.g.material_style = 'darker'
		end,
	},
	{ 'sainnhe/sonokai' },
	{ 'rose-pine/neovim' },
	{ 'tiagovla/tokyodark.nvim' },
	{ 'catppuccin/nvim' },

	{ 'nvim-lualine/lualine.nvim' },

	{ 'neovim/nvim-lspconfig', dependencies = { 'hrsh7th/nvim-cmp' } },

	{ 'nvim-lua/plenary.nvim' },

	{ 'rktjmp/lush.nvim' },

	-- Telescope
	{ 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'nvim-telescope/telescope-ui-select.nvim' },
	{ 'nvim-telescope/telescope-file-browser.nvim' },

	-- Tree
	{ 'nvim-tree/nvim-web-devicons' },
	{ 'nvim-tree/nvim-tree.lua' },

	-- Git
	{ 'tpope/vim-fugitive' },
	{ 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Autocomplete & Snips
	-- https://github.com/L3MON4D3/LuaSnip
	-- Demo: https://www.youtube.com/watch?v=Dn800rlPIho
	{ 'L3MON4D3/LuaSnip' },
	{ 'hrsh7th/nvim-cmp', dependencies = { 'onsails/lspkind.nvim' } },
	{ 'hrsh7th/cmp-nvim-lsp', dependencies = { 'hrsh7th/nvim-cmp' } },
	{ 'hrsh7th/cmp-nvim-lua', dependencies = { 'hrsh7th/nvim-cmp' } },
	{ 'hrsh7th/cmp-path', dependencies = { 'hrsh7th/nvim-cmp' } },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'onsails/lspkind.nvim' },

	-- Other --------------------------------------------------

	{ 'jose-elias-alvarez/null-ls.nvim' },

	-- https://github.com/numToStr/Comment.nvim
	-- Demo: https://www.youtube.com/watch?v=-InmtHhk2qM
	{ 'numToStr/Comment.nvim' },
	-- Enable treesitter module to set the comment string based on the position of the cursor inside the file
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },

	-- https://github.com/glepnir/lspsaga.nvim
	{ 'glepnir/lspsaga.nvim', branch = 'main' },

	{ 'j-hui/fidget.nvim', tag = 'legacy' },

	{ 'windwp/nvim-autopairs' },
	{ 'windwp/nvim-ts-autotag' },

	{ 'lukas-reineke/indent-blankline.nvim' },

	{ 'rcarriga/nvim-notify' },

	{ 'mattn/emmet-vim' },

	{ 'mbbill/undotree' },

	{
		'akinsho/bufferline.nvim',
		-- tag = '*',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},

	{ 'jose-elias-alvarez/typescript.nvim' },

	{
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
	},
})

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

-- https://github.com/folke/lazy.nvim#-plugin-spec
require('lazy').setup({

	{ dir = '~/repos/stackmap.nvim' },

	-- Treesitter
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'nvim-treesitter/playground' },
	-- Enable treesitter module to set the comment string based on the position of the cursor inside the file
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },

	-- LSP
	{ 'neovim/nvim-lspconfig', dependencies = { 'hrsh7th/nvim-cmp' } },
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				'williamboman/mason.nvim', -- Optional
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required

			-- Snippets
			{ 'L3MON4D3/LuaSnip' }, -- Required
		},
	},
	{ 'jose-elias-alvarez/null-ls.nvim' },
	{ 'jose-elias-alvarez/typescript.nvim' },

	{ 'glepnir/lspsaga.nvim', branch = 'main' },

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

	-- Color schemes & UI Visuals
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
	{ 'rktjmp/lush.nvim' },

	{ 'nvim-lualine/lualine.nvim' },
	{ 'lukas-reineke/indent-blankline.nvim' },
	{ 'j-hui/fidget.nvim', tag = 'legacy' },
	{ 'rcarriga/nvim-notify' },
	{
		'akinsho/bufferline.nvim',
		-- tag = '*',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		'echasnovski/mini.indentscope',
		version = '*',
		event = { 'BufReadPre', 'BufNewFile' },
		opts = {
			symbol = '│',
			options = { try_as_border = true },
		},
	},
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		opts = {
			-- https://github.com/folke/noice.nvim#%EF%B8%8F-configuration
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['cmp.entry.get_documentation'] = true,
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			routes = {
				{
					filter = {
						event = 'msg_show',
						any = {
							{ find = '%d+L, %d+B' },
							{ find = '%d+ lines, %d+ bytes written' },
							{ find = 'line %d+ of %d+ --%d+\\%-- col %d+-%d+' },
							{ find = 'line %d+ of %d+' },
							{ find = '; after #%d+' },
							{ find = '; before #%d+' },
						},
					},
					view = 'mini',
				},
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			'MunifTanjim/nui.nvim',
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			'rcarriga/nvim-notify',
		},
	},

	-- Functionality ---------------------------------------

	-- https://github.com/numToStr/Comment.nvim
	-- Demo: https://www.youtube.com/watch?v=-InmtHhk2qM
	{ 'numToStr/Comment.nvim' },

	{ 'windwp/nvim-autopairs' },
	{ 'windwp/nvim-ts-autotag' },

	{ 'mattn/emmet-vim' },

	{ 'mbbill/undotree' },

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

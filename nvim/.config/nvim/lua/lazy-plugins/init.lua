return {
	{ 'folke/neodev.nvim' },

	{ dir = '~/repos/stackmap.nvim' },

	-- Treesitter
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'nvim-treesitter/playground' },
	-- Enable treesitter module to set the comment string based on the position of the cursor inside the file
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },
	{ 'Glench/Vim-Jinja2-Syntax' },

	-- LSP
	{
		'neovim/nvim-lspconfig',
		dependencies = { 'hrsh7th/nvim-cmp' },
	},
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
	{
		'folke/trouble.nvim', -- https://github.com/folke/trouble.nvim
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		cmd = 'Trouble',
		keys = {
			{
				'<Leader>dd',
				'<Cmd>TroubleToggle document_diagnostics<CR>',
				desc = 'Document Diagnostics (Trouble)',
			},
		},
	},

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
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
			'MunifTanjim/nui.nvim',
		},
		opts = {
			sources = {
				'filesystem',
				'buffers',
				'git_status',
				'document_symbols',
			},
			default_component_configs = {
				icon = {
					folder_empty = '󰜌',
					folder_empty_open = '󰜌',
				},
				git_status = {
					symbols = {
						renamed = '󰁕',
						unstaged = '󰄱',
					},
				},
			},
			document_symbols = {
				kinds = {
					File = { icon = '󰈙', hl = 'Tag' },
					Namespace = { icon = '󰌗', hl = 'Include' },
					Package = { icon = '󰏖', hl = 'Label' },
					Class = { icon = '󰌗', hl = 'Include' },
					Property = { icon = '󰆧', hl = '@property' },
					Enum = { icon = '󰒻', hl = '@number' },
					Function = { icon = '󰊕', hl = 'Function' },
					String = { icon = '󰀬', hl = 'String' },
					Number = { icon = '󰎠', hl = 'Number' },
					Array = { icon = '󰅪', hl = 'Type' },
					Object = { icon = '󰅩', hl = 'Type' },
					Key = { icon = '󰌋', hl = '' },
					Struct = { icon = '󰌗', hl = 'Type' },
					Operator = { icon = '󰆕', hl = 'Operator' },
					TypeParameter = { icon = '󰊄', hl = 'Type' },
					StaticMethod = { icon = '󰠄 ', hl = 'Function' },
				},
			},
			-- Add this section only if you've configured source selector.
			source_selector = {
				sources = {
					{ source = 'filesystem', display_name = ' 󰉓 Files ' },
					{ source = 'git_status', display_name = ' 󰊢 Git ' },
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},

			-- Other options ...
		},
		keys = {
			{
				'<Leader>1',
				'<Cmd>Neotree source=filesystem position=left toggle<CR>',
				desc = 'Neotree File System Toggle',
			},
			{
				'<Leader>2',
				'<Cmd>Neotree source=document_symbols position=right toggle<CR>',
				desc = 'Neotree Document Symbols Toggle',
			},
			{
				'<Leader>3',
				'<Cmd>Neotree source=git_status position=right toggle<CR>',
				desc = 'Neotree Git Status Toggle',
			},
		},
		cmd = {
			'Neotree',
		},
	},

	-- Git
	{ 'tpope/vim-fugitive' },
	{ 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Color schemes & UI Visuals
	{
		'lucastrvsn/kikwis',
		lazy = true,
	},
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require('tokyonight').setup({
				-- transparent = true,
				style = 'moon',
				-- styles = {
				-- 	sidebars = 'transparent',
				-- 	floats = 'transparent',
				-- },
			})

			print('tokyonight!')

			vim.cmd([[colorscheme tokyonight]])

			-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'None' })
			vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'None' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'None' })
			vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#555555', ctermbg = 0 })
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#5eacd3' })
			vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#589ed7' })
			vim.api.nvim_set_hl(0, 'netrwDir', { fg = '#5eacd3' })
			vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#c3e88d', bg = 'None' })
			vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#f07178', bg = 'None' })
		end,
	},
	{
		dir = '~/repos/claudio-darker.lua',
		-- config = "vim.cmd('colorscheme claudio-darker')",
	},
	{
		'marko-cerovac/material.nvim',
		config = function()
			vim.g.material_style = 'darker'

			local material_colors = require('material.colors')
			require('material').setup({
				high_visibility = {
					lighter = false,
					darker = true,
				},

				custom_highlights = {
					Normal = { bg = 'None' },
					LineNr = { bg = 'None' },
					SignColumn = { bg = 'None' },
					CursorLineNr = { bg = 'None' },
					CursorLine = { bg = '#121212' },
					ColorColumn = { bg = '#121212' },
					GitSignsAdd = { fg = '#547722', bg = 'None' },
					GitSignsChange = { fg = '#571980', bg = 'None' },
					GitSignsDelete = { fg = '#ff0000', bg = 'None' },
					LspReferenceText = { bg = 'None', underline = true, bold = true, sp = '#89ddff' },
					LspReferenceRead = { bg = 'None', underline = true, bold = true, sp = '#00ff00' },
					LspReferenceWrite = { bg = 'None', underline = true, bold = true, sp = '#ff0000' },
					['@keyword'] = { fg = material_colors.main.purple },
					['@include'] = { fg = material_colors.main.purple },
					['@parameter'] = { fg = material_colors.syntax.value },
				},

				disable = {
					colored_cursor = true,
					background = false,
				},
			})
			-- vim.cmd([[colorscheme material]])
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

	{
		'ThePrimeagen/refactoring.nvim',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
		opts = {},
		keys = {
			{
				'<leader>ev',
				[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
				mode = 'v',
				desc = 'Extract Variable (Refactoring)',
			},
		},
	},

	{
		'RRethy/vim-illuminate',
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { 'lsp' },
			},
		},

		-- Copied as-is from: https://github.com/LazyVim/LazyVim/blob/9c120b5ef7dfaba0079ed632859a778b8f103991/lua/lazyvim/plugins/editor.lua#L327C10-L350
		config = function(_, opts)
			require('illuminate').configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set('n', key, function()
					require('illuminate')['goto_' .. dir .. '_reference'](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
			end

			map(']]', 'next')
			map('[[', 'prev')

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd('FileType', {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map(']]', 'next', buffer)
					map('[[', 'prev', buffer)
				end,
			})
		end,
		keys = {
			{ ']]', desc = 'Next Reference' },
			{ '[[', desc = 'Prev Reference' },
		},
	},
	{
		'prisma/vim-prisma',
	},
}

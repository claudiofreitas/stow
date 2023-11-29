return {
	{
		'folke/neodev.nvim',
		config = true,
	},

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
	-- { 'jose-elias-alvarez/null-ls.nvim' },
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
	{
		'mfussenegger/nvim-lint',
		config = function()
			local lint = require('lint')
			lint.linters.eslint_d.parser = function(output, bufnr)
				local severities = {
					vim.diagnostic.severity.WARN,
					vim.diagnostic.severity.ERROR,
				}
				local eslint_parser = function(_output, _bufnr)
					if vim.trim(_output) == '' then
						return {}
					end
					local decode_opts = { luanil = { object = true, array = true } }
					local ok, data = pcall(vim.json.decode, _output, decode_opts)
					if not ok then
						return {
							{
								bufnr = _bufnr,
								lnum = 0,
								col = 0,
								message = 'Could not parse linter output due to: ' .. data .. '\noutput: ' .. _output,
							},
						}
					end
					-- See https://eslint.org/docs/latest/use/formatters/#json
					local diagnostics = {}
					for _, result in ipairs(data or {}) do
						for _, msg in ipairs(result.messages or {}) do
							-- TODO: move this logic into a personal separate package
							if msg.ruleId ~= 'simple-import-sort/imports' then
								table.insert(diagnostics, {
									lnum = msg.line and (msg.line - 1) or 0,
									end_lnum = msg.endLine and (msg.endLine - 1) or nil,
									col = msg.column and (msg.column - 1) or 0,
									end_col = msg.endColumn and (msg.endColumn - 1) or nil,
									message = msg.message,
									code = msg.ruleId,
									severity = severities[msg.severity],
									source = 'eslint_d',
								})
							end
						end
					end
					return diagnostics
				end
				local result = eslint_parser(output, bufnr)
				for _, d in ipairs(result) do
					d.source = 'eslint_d'
				end
				return result
			end
			-- The following can be used to fix a file:
			-- lint.linters.eslint_d.args = {
			-- 	'--fix',
			-- 	'--format',
			-- 	'json',
			-- 	'--stdin',
			-- 	'--stdin-filename',
			-- 	function()
			-- 		return vim.api.nvim_buf_get_name(0)
			-- 	end,
			-- }
			lint.linters_by_ft = {
				javascript = { 'eslint_d' },
				typescript = { 'eslint_d' },
				typescriptreact = { 'eslint_d' },
				javascriptreact = { 'eslint_d' },
			}
			vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'InsertLeave' }, {
				callback = function()
					lint.try_lint()
				end,
			})
			vim.keymap.set('n', '<Leader>l', function()
				lint.try_lint()
				vim.diagnostic.show()
			end, { desc = 'Lint' })
		end,
	},
	{
		'stevearc/conform.nvim',
		event = { 'BufWritePre' },
		cmd = { 'ConformInfo' },
		keys = {
			{
				-- Customize this to your liking
				'<Leader>f',
				function()
					require('conform').format({
						async = true,
						lsp_fallback = true,
					})
				end,
				mode = '',
				desc = 'Format buffer (conform)',
			},
		},
		opts = {
			-- define your formatters
			formatters_by_ft = {
				javascript = {
					{ 'prettierd', 'prettier' },
				},
				typescript = {
					{ 'prettierd', 'prettier' },
				},
				javascriptreact = {
					{ 'prettierd', 'prettier' },
				},
				typescriptreact = {
					{ 'prettierd', 'prettier' },
				},
				lua = {
					{ 'stylua' },
				},
			},
			formatters = {
				shfmt = {
					prepend_args = { '-i', '2' },
				},
			},
		},
		init = function()
			-- if you want the formatexpr, here is the place to set it
			-- vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
		end,
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
	{ 'sindrets/diffview.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

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
		'rose-pine/neovim',
		config = function()
			require('rose-pine').setup({
				variant = 'moon',
				-- dim_nc_background = true,

				groups = {
					background_nc = 'overlay',
				},
			})
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
	{ 'tiagovla/tokyodark.nvim' },
	{ 'catppuccin/nvim' },
	{ 'rktjmp/lush.nvim' },

	{ 'nvim-lualine/lualine.nvim' },
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {
			indent = {
				char = '│',
			},

			-- show_trailing_blankline_indent = false,
			whitespace = {
				remove_blankline_trail = true,
			},

			-- filetype_exclude = {
			-- 	'help',
			-- 	'alpha',
			-- 	'dashboard',
			-- 	'neo-tree',
			-- 	'Trouble',
			-- 	'lazy',
			-- 	'mason',
			-- 	'notify',
			-- 	'toggleterm',
			-- 	'lazyterm',
			-- },
			exclude = {
				filetypes = {
					'help',
					'alpha',
					'dashboard',
					'neo-tree',
					'Trouble',
					'lazy',
					'mason',
					'notify',
					'toggleterm',
					'lazyterm',
				},
			},

			-- show_current_context = false,
			scope = {
				enabled = false,
			},
		},
	},

	{ 'j-hui/fidget.nvim', tag = 'legacy' },

	{ 'rcarriga/nvim-notify' },

	{
		'akinsho/bufferline.nvim',
		-- tag = '*',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt
		opts = {
			options = {
				mode = 'buffers',
				numbers = 'none',
				middle_mouse_command = nil,
				right_mouse_command = nil,
				indicator = {
					style = 'none',
				},
				-- Icons
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				modified_icon = ' ',
				-- close_icon = '󰅖',
				-- buffer_close_icon = 'x',
				show_duplicate_prefix = true,
				offsets = {
					{
						filetype = 'NvimTree',
						text = nil,
						text_align = 'left',
						separator = false,
					},
				},
				separator_style = { '', '' },
			},
			-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt#L742
			highlights = {
				-- Active buffer ----------------------------------------------------------
				buffer_selected = {
					fg = '#ffa500',
					italic = false,
					bold = true,
				},
				close_button_selected = {
					fg = '#ffa500',
					bold = true,
					-- underline = true,
					-- sp = '#ffa500',
				},
				-- Inactive buffers (when you have more than one buffer open) -------------
				background = {
					fg = '#757575',
				},
				close_button = {
					fg = '#757575',
				},
				-- Background buffer (for example with the Telescope open) ----------------
				buffer_visible = {
					fg = '#474747',
				},
				close_button_visible = {
					fg = '#474747',
				},
				modified_visible = {
					fg = '#474747',
				},
				-- Modified icon (floppy disk) --------------------------------------------
				modified = {
					fg = '#f07178',
				},
				modified_selected = {
					fg = '#f07178',
				},
			},
		},
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
				[[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
				mode = 'v',
				desc = 'Extract Variable (Refactoring)',
			},
		},
	},

	{
		'ThePrimeagen/harpoon',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{
				'<C-h>',
				[[<Esc><Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]],
				mode = '',
				desc = '[harpoon] Menu',
			},
			{
				'<C-h><C-h>',
				[[<Esc><Cmd>lua require('harpoon.mark').add_file()<CR>]],
				mode = '',
				desc = '[harpoon] Add',
			},
		},
	},

	{
		'chentoast/marks.nvim',
		-- https://github.com/chentoast/marks.nvim
		opts = {
			default_mappings = false,
			-- builtin_marks = { ".", "<", ">", "^" },
			-- cyclic = true,
			-- whether the shada file is updated after modifying uppercase marks. default false
			force_write_shada = true,
			refresh_interval = 250,
			-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
			-- marks, and bookmarks.
			-- can be either a table with all/none of the keys, or a single number, in which case
			-- the priority applies to all marks.
			-- default 10.
			sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
			-- disables mark tracking for specific filetypes. default {}
			excluded_filetypes = {},
			-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
			-- sign/virttext. Bookmarks can be used to group together positions and quickly move
			-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
			-- default virt_text is "".
			bookmark_0 = {
				sign = '⚑',
				-- virt_text = "hello world",
				-- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
				-- defaults to false.
				annotate = false,
			},
			-- https://github.com/chentoast/marks.nvim#mappings
			mappings = {
				set_bookmark0 = '<F3>',
				delete_bookmark = '<S-F3>',
				prev_bookmark0 = '[b',
				next_bookmark0 = ']b',
				annotate = '<C-F3>',
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

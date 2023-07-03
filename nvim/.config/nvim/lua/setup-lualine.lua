-- https://github.com/nvim-lualine/lualine.nvim

local b = { bg = '#212121', fg = '#B0BEC5' }
local c = { bg = 'None', fg = '#B0BEC5' }

local normal = {
	a = { bg = '#ff9800', fg = '#212121' },
	b = b,
	c = c,
}

local insert = {
	a = { bg = '#c3e88d', fg = '#212121' },
	b = b,
	c = c,
}

local visual = {
	a = { bg = '#c792ea', fg = '#212121' },
	b = b,
	c = c,
}

local command = {
	a = { bg = '#f07178', fg = '#212121' },
	b = b,
	c = c,
}

local function get_lsp_clients()
	local empty_msg = 'No Active LSP'
	local lsp_clients = vim.lsp.get_active_clients()
	if next(lsp_clients) == nil then
		return empty_msg
	end

	local msg = ''
	for i, client in ipairs(lsp_clients) do
		local filetypes = client.config.filetypes
		local buffer_filetype = vim.api.nvim_buf_get_option(0, 'filetype')
		if filetypes and vim.fn.index(filetypes, buffer_filetype) ~= -1 then
			if i ~= 1 then
				msg = msg .. ','
			end
			msg = msg .. client.name
		end
	end
	return msg or empty_msg
end

local ok, lualine = pcall(require, 'lualine')
if not ok then
  print('error on trying to load lualine')
	return nil
end

lualine.setup({
	options = {
		-- theme = 'auto',
		theme = {
			normal = normal,
			insert = insert,
			visual = visual,
			command = command,
		},

		component_separators = { left = '❘', right = '❘' },
	},

	-- https://github.com/nvim-lualine/lualine.nvim#general-component-options
	sections = {
		-- lualine_a = {
		--   { 'mode', separator = { left = '' }, right_padding = 2 },
		-- },
		lualine_b = {
			{ 'branch', icon = { '' } },
			{ 'filename', file_status = false, path = 1 },
			{ get_lsp_clients, icon = ' LSP:' },
		},
		lualine_c = {},

		lualine_x = {
			{ 'diagnostics', sources = { 'nvim_diagnostic' }, sections = { 'error', 'warn', 'info', 'hint' } },
		},
		lualine_y = {
			{ 'encoding' },
			{ 'fileformat', symbols = { unix = ' LF', dos = ' CRLF', mac = ' CR' } },
			{ 'filetype' },
			{ 'progress' },
		},
	},

	-- winbar = {
	-- 	lualine_x = {
	-- 		{ 'diagnostics', sources = { 'nvim_diagnostic' }, sections = { 'error', 'warn', 'info', 'hint' } },
	-- 	},
	-- },
})

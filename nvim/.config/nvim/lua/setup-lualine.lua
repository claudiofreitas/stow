-- https://github.com/nvim-lualine/lualine.nvim

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

require('lualine').setup({
	options = {
		theme = 'auto',
	},

	-- https://github.com/nvim-lualine/lualine.nvim#general-component-options
	sections = {
		-- lualine_a = {
		--   { 'mode', separator = { left = '' }, right_padding = 2 },
		-- },
		-- lualine_b = {
		--   {
		--     'branch',
		--     icon = { '' },
		--   },
		-- },
		lualine_c = {
			{ 'filename' },
			{
				get_lsp_clients,
				icon = ' LSP:',
				color = {
					fg = '#ffffff',
					gui = 'bold',
				},
			},
		},
	},

	-- winbar = {
	--   lualine_a = {'filename'},
	-- },
})

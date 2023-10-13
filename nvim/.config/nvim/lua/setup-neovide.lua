-- https://neovide.dev/configuration.html

if vim.g.neovide then
	vim.o.guifont = 'SauceCodePro Nerd Font:h18'
	vim.g.neovide_cursor_animation_length = 0.005 -- default = 0.06
	vim.g.neovide_cursor_trail_size = 0.010 -- default = 0.7
	vim.g.neovide_cursor_antialiasing = true

	local transparency = 1.0
	vim.g.neovide_transparency = 1.0
	vim.g.transparency = transparency
	vim.g.neovide_background_color = string.format('#212121%x', transparency * 255) --"'#0f1117'.printf('%x', float2nr(255 * g:transparency))"

	vim.g.neovide_scroll_animation_length = 0.05 -- default = 0.3
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_underline_automatic_scaling = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_input_use_logo = true
	vim.g.neovide_input_macos_alt_is_meta = true

	vim.g.neovide_cursor_vfx_mode = 'railgun' -- railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
	vim.g.neovide_cursor_vfx_particle_density = 15.0 -- default = 7.0
	vim.g.neovide_cursor_vfx_opacity = 230.0 -- default = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 0.6 -- default = 1.2
	vim.g.neovide_cursor_vfx_particle_speed = 10.0 -- default = 10.0
	vim.g.neovide_cursor_vfx_particle_phase = 0.5 -- default 1.5 (only for railgun)
	vim.g.neovide_cursor_vfx_particle_curl = 10.0 -- default 1.0 (only for railgun)

	vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
	vim.keymap.set('v', '<D-c>', '"+y') -- Copy
	vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
	vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
	vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
	vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

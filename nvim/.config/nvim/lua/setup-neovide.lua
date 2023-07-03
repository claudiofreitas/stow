if vim.g.neovide then
	vim.o.guifont = 'SauceCodePro Nerd Font:h18'
	vim.g.neovide_cursor_animation_length = 0.005 -- default = 0.06
	vim.g.neovide_cursor_trail_size = 0.010 -- default = 0.7

	local transparency = 0.98
	vim.g.neovide_transparency = 0.0
	vim.g.transparency = transparency
	vim.g.neovide_background_color = string.format('#212121%x', transparency * 255) --"'#0f1117'.printf('%x', float2nr(255 * g:transparency))"

	vim.g.neovide_scroll_animation_length = 0.05 -- default = 0.3
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_underline_automatic_scaling = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_input_use_logo = true
	vim.g.neovide_input_macos_alt_is_meta = true
	vim.g.neovide_cursor_vfx_mode = 'pixiedust'
	vim.g.neovide_cursor_vfx_particle_density = 15.0 -- default = 7.0
end

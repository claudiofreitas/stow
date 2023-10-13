local wezterm = require("wezterm")

-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end

local config = {
	color_scheme = "Tokyo Night Moon",
	enable_tab_bar = false,
	font = wezterm.font("SauceCodePro Nerd Font"),
	font_size = 18,
	adjust_window_size_when_changing_font_size = false,
	-- macos_window_background_blur = 30,

	-- This is good for launcher:
	window_decorations = "RESIZE",

	window_close_confirmation = "NeverPrompt",

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- window_frame = {
	-- 	border_left_width = '0cell',
	-- 	border_right_width = '0cell',
	-- 	border_top_height = '0cell',
	-- 	border_bottom_height = '0cell',
	-- },

	background = {
		{
			source = {
				Gradient = {
					orientation = "Horizontal",
					colors = {
						"#00000C",
						"#000026",
						"#00000C",
					},
					interpolation = "CatmullRom",
					blend = "Rgb",
					noise = 0,
				},
			},
			width = "100%",
			height = "100%",
			opacity = 1.0,
		},
		{
			source = {
				File = {
					path = wezterm.config_dir .. "/blob_blue.gif",
					speed = 0.2,
				},
			},
			repeat_x = "Mirror",
			-- width = "100%",
			height = "100%",
			opacity = 0.20,
			hsb = {
				hue = 0.9,
				saturation = 0.9,
				brightness = 0.8,
			},
		},
	},
}

return config

-- https://wezfurlong.org/wezterm/config/files.html
local wezterm = require("wezterm")

-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end

local config = {
	-- color_scheme = "Tokyo Night Moon",
	-- color_scheme = "Catppuccin Mocha",
	colors = {
		foreground = "#eaeae9",
		background = "#181818",
		selection_fg = "#e5e5e4",
		selection_bg = "#4d4d4d",
		-- scrollbar_thumb = '',
		-- split = '',
		cursor_bg = "#f9a824",
		cursor_fg = "white",
		cursor_border = "#f9a824",

		ansi = {
			"#2c2c2c", -- black
			"#c62727", -- maroon
			"#558b2e", -- green
			"#f9a824", -- olive
			"#1564bf", -- navy
			"#691e99", -- purple
			"#00828e", -- teal
			"#f2f2f2", -- silver
		},
		brights = {
			"#535353", -- grey
			"#ef524f", -- red
			"#558b2e", -- lime
			"#ffea3a", -- yellow
			"#64b5f6", -- blue
			"#ba67c8", -- fuchsia
			"#26c6da", -- aqua
			"#e0e0e0", -- white
		},
		indexed = { [136] = "#ff0000" },
	},

	window_frame = {
		active_titlebar_bg = "#181818",
		-- active_titlebar_fg = '',
		inactive_titlebar_bg = "#181818",
		-- inactive_titlebar_fg = '',
		-- inactive_titlebar_border_bottom = "#2b2042",
		inactive_titlebar_border_bottom = "#ff0000",
		active_titlebar_border_bottom = "#2b2042",

		-- button_fg = "#cccccc",
		-- button_bg = "#2b2042",
		-- button_hover_fg = "#ffffff",
		-- button_hover_bg = "#3b3052",

		-- border_left_width = "0.1cell",
		-- border_right_width = "0.1cell",
		-- border_bottom_height = "0.1cell",
		-- border_top_height = "1px",

		border_left_color = "black",
		border_right_color = "black",
		border_bottom_color = "black",
		border_top_color = "black",
	},

	-- => 0
	enable_tab_bar = true,
	show_tabs_in_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	font = wezterm.font({
		family = "SauceCodePro Nerd Font",
		weight = "DemiBold",
		stretch = "Normal",

		-- https://wezfurlong.org/wezterm/config/font-shaping.html#advanced-font-shaping-options
		harfbuzz_features = {
			"zero",
		},
	}),
	freetype_interpreter_version = 40,
	freetype_load_target = "Normal",
	freetype_load_flags = "NO_HINTING",
	font_size = 22,
	adjust_window_size_when_changing_font_size = false,
	-- macos_window_background_blur = 30,

	animation_fps = 10,
	cursor_blink_ease_in = "EaseIn",
	cursor_blink_ease_out = "EaseOut",
	anti_alias_custom_block_glyphs = true,
	-- bold_brightens_ansi_colors = "No",

	keys = {
		{
			key = "P",
			mods = "CTRL",
			action = wezterm.action.ActivateCommandPalette,
		},
	},

	command_palette_font_size = 24.0,

	-- This is good for launcher:
	-- window_decorations = "RESIZE",
	-- https://wezfurlong.org/wezterm/config/launch.html
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",

	-- https://wezfurlong.org/wezterm/config/default-keys.html
	disable_default_key_bindings = false,

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

	-- background = {
	-- {
	-- 	source = {
	-- 		Gradient = {
	-- 			orientation = "Horizontal",
	-- 			colors = {
	-- 				"#00000C",
	-- 				"#000026",
	-- 				"#00000C",
	-- 			},
	-- 			interpolation = "CatmullRom",
	-- 			blend = "Rgb",
	-- 			noise = 0,
	-- 		},
	-- 	},
	-- 	width = "100%",
	-- 	height = "100%",
	-- 	opacity = 1.0,
	-- },
	-- {
	-- 	source = {
	-- 		File = {
	-- 			path = wezterm.config_dir .. "/blob_blue.gif",
	-- 			speed = 0.2,
	-- 		},
	-- 	},
	-- 	repeat_x = "Mirror",
	-- 	-- width = "100%",
	-- 	height = "100%",
	-- 	opacity = 0.20,
	-- 	hsb = {
	-- 		hue = 0.9,
	-- 		saturation = 0.9,
	-- 		brightness = 0.8,
	-- 	},
	-- },
	-- },
}

return config

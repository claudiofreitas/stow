-- https://wezfurlong.org/wezterm/config/files.html
local wezterm = require("wezterm")

-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end

local config = {
	audible_bell = "Disabled",

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

	enable_wayland = false,

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
	enable_tab_bar = false,
	show_tabs_in_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	-- Troubleshoot: `wezterm ls-fonts --list-system | rg monofur -i --passthrough`
	-- font = wezterm.font({
	-- 	family = "Liga SFMono Nerd Font",
	-- 	weight = "DemiBold",
	-- 	stretch = "Normal",
	-- }),
	font = wezterm.font_with_fallback({

		-- {
		-- 	family = "Liga SFMono Nerd Font",
		-- 	weight = "DemiBold",
		-- 	stretch = "Normal",
		-- 	harfbuzz_features = {
		-- 		"zero",
		-- 	},
		-- },
		{
			family = "SauceCodePro Nerd Font",
		  weight = "DemiBold",
		  stretch = "Normal",
			harfbuzz_features = {
				"zero",
			},
	  },

		-- テスト

		-- https://wezfurlong.org/wezterm/config/font-shaping.html#advanced-font-shaping-options
		-- harfbuzz_features = {
		-- 	"zero",
		-- },
	}),

	-- font = wezterm.font("Monofur Nerd Font Propo", {weight = "Bold"}),
	-- font = wezterm.font("SauceCodePro Nerd Font", {weight = "DemiBold"}),

	freetype_interpreter_version = 40,
	freetype_load_target = "Normal",
	freetype_load_flags = "NO_HINTING",
	font_size = 13,
	adjust_window_size_when_changing_font_size = false,
	-- macos_window_background_blur = 30,

	animation_fps = 10,
	cursor_blink_rate = 0,
	cursor_blink_ease_in = "EaseIn",
	cursor_blink_ease_out = "EaseOut",
	anti_alias_custom_block_glyphs = true,
	-- bold_brightens_ansi_colors = "No",

	command_palette_font_size = 24.0,

	-- This is good for launcher:
	-- window_decorations = "RESIZE",
	-- https://wezfurlong.org/wezterm/config/launch.html
	-- window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_decorations = "RESIZE",
	-- window_decorations = "RESIZE|TITLE",

	-- ------------------------------------------------------------- Key Bindings
	-- https://wezfurlong.org/wezterm/config/default-keys.html
	disable_default_key_bindings = true,
	keys = {
		{
			mods = "CTRL",
			key = "p",
			action = wezterm.action.ActivateCommandPalette,
		},
		{
			mods = "SUPER",
			key = "q",
			action = wezterm.action.QuitApplication,
		},

		-- Increase font (ctrl+=)
		{
			mods = "CTRL",
			key = "=",
			action = wezterm.action.IncreaseFontSize,
		},

		-- Increase font (cmd+=)
		{
			mods = "SUPER",
			key = "=",
			action = wezterm.action.IncreaseFontSize,
		},

		-- Decrease font (ctrl+-)
		{
			mods = "CTRL",
			key = "-",
			action = wezterm.action.DecreaseFontSize,
		},

		-- Decrease font (cmd+-)
		{
			mods = "SUPER",
			key = "-",
			action = wezterm.action.DecreaseFontSize,
		},

		-- Reset font (cmd+0)
		{
			mods = "SUPER",
			key = "0",
			action = wezterm.action.ResetFontSize,
		},

		-- Paste (cmd+v)
		{
			mods = "SUPER",
			key = "v",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
		-- Paste (ctrl+shift+v)
		{
			mods = "CTRL|SHIFT",
			key = "v",
			action = wezterm.action.PasteFrom("Clipboard"),
		},

		-- Paste (ctrl+v)
		-- {
		-- 	mods = "CTRL",
		-- 	key = "v",
		-- 	action = wezterm.action.PasteFrom("Clipboard"),
		-- },

		-- Tmux Previous Window (cmd+left)
		{
			mods = "SUPER",
			key = "LeftArrow",
			action = wezterm.action.Multiple({
				wezterm.action.SendKey({
					mods = "CTRL",
					key = "f",
				}),
				wezterm.action.SendKey({
					mods = "CTRL",
					key = "p",
				}),
			}),
		},

		-- Tmux Next Window (cmd+right)
		{
			mods = "SUPER",
			key = "RightArrow",
			action = wezterm.action.Multiple({
				wezterm.action.SendKey({
					mods = "CTRL",
					key = "f",
				}),
				wezterm.action.SendKey({
					mods = "CTRL",
					key = "n",
				}),
			}),
		},

		-- Tmux New Window (cmd+t)
		{
			mods = "SUPER",
			key = "t",
			action = wezterm.action.Multiple({
				wezterm.action.SendKey({
					mods = "CTRL",
					key = "f",
				}),
				wezterm.action.SendKey({
					key = "t",
				}),
			}),
		},

		-- Tmux Close Window (cmd+w)
		{
			mods = "SUPER",
			key = "w",
			action = wezterm.action.Multiple({
				wezterm.action.SendKey({
					mods = "CTRL",
					key = "f",
				}),
				wezterm.action.SendKey({
					key = "X",
				}),
			}),
		},
	},

	-- ----------------------------------------------------------- Mouse Bindings
	-- https://wezfurlong.org/wezterm/config/mouse.html
	mouse_bindings = {
		-- Increase font (ctrl+scroll up)
		{
			mods = "CTRL",
			event = {
				Down = {
					streak = 1,
					button = { WheelUp = 1 },
				},
			},
			action = wezterm.action.IncreaseFontSize,
		},
		{
			mods = "CTRL",
			event = {
				Down = {
					streak = 1,
					button = { WheelUp = 1 },
				},
			},
			action = wezterm.action.IncreaseFontSize,
			-- force this to work with tmux/nvim/etc
			-- https://wezfurlong.org/wezterm/config/mouse.html?h=alt_screen#configuring-mouse-assignments
			alt_screen = 'Any',
			-- force this to work with tmux/nvim/etc
			-- https://wezfurlong.org/wezterm/config/mouse.html?h=mouse_reporting#configuring-mouse-assignments
			mouse_reporting = true, 
		},

		-- Decrease font (ctrl+scroll down)
		{
			mods = "CTRL",
			event = {
				Down = {
					streak = 1,
					button = { WheelDown = 1 },
				},
			},
			action = wezterm.action.DecreaseFontSize,
		},
		{
			mods = "CTRL",
			event = {
				Down = {
					streak = 1,
					button = { WheelDown = 1 },
				},
			},
			action = wezterm.action.DecreaseFontSize,
			-- force this to work with tmux/nvim/etc
			-- https://wezfurlong.org/wezterm/config/mouse.html?h=alt_screen#configuring-mouse-assignments
			alt_screen = 'Any',
			-- force this to work with tmux/nvim/etc
			-- https://wezfurlong.org/wezterm/config/mouse.html?h=mouse_reporting#configuring-mouse-assignments
			mouse_reporting = true,
		},
	},




	-- TODO: I could not make this work yet
	-- disable_default_mouse_bindings = true,
	-- mouse_bindings = {
	-- 	{
	-- 		mods = "SUPER",
	-- 		event = {
	-- 			Down = {
	-- 				streak = 1,
	-- 				button = "Left",
	-- 			},
	-- 		},
	-- 		action = wezterm.action.Nop,
	-- 	},
	-- 	{
	-- 		mods = "SUPER",
	-- 		event = {
	-- 			Up = {
	-- 				streak = 1,
	-- 				button = "Left",
	-- 			},
	-- 		},
	-- 		action = wezterm.action.OpenLinkAtMouseCursor,
	-- 	},
	-- },

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

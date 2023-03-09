local wezterm = require("wezterm")

local function is_vi_process(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local function conditional_activate_pane(window, pane, pane_direction, vim_direction)
	if is_vi_process(pane) then
		window:perform_action(wezterm.action.SendKey({ key = vim_direction, mods = "ALT" }), pane)
	else
		window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditional_activate_pane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditional_activate_pane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditional_activate_pane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditional_activate_pane(window, pane, "Down", "j")
end)

local colors = {
	rosewater = "#e5646a",
	flamingo = "#e5646a",
	pink = "#c68aee",
	mauve = "#e5646a",
	red = "#e05f65",
	maroon = "#e05f65",
	peach = "#e05f65",
	yellow = "#f1cf8a",
	green = "#A6DA95",
	teal = "#74bee9",
	sky = "#74bee9",
	sapphire = "#78dba9",
	blue = "#70a5eb",
	lavender = "#c68aee",

	text = "#CAD3F5",
	subtext1 = "#B8C0E0",
	subtext0 = "#A5ADCB",
	overlay2 = "#939AB7",
	overlay1 = "#8087A2",
	overlay0 = "#6E738D",
	surface2 = "#5B6078",
	surface1 = "#494D64",
	surface0 = "#363A4F",

	base = "#101419",
	mantle = "#101419",
	crust = "#101419",
}

local function get_process(tab)
	local process_icons = {
		["docker"] = {
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["docker-compose"] = {
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["nvim"] = {
			{ Text = wezterm.nerdfonts.custom_vim },
		},
		["vim"] = {
			{ Text = wezterm.nerdfonts.dev_vim },
		},
		["node"] = {
			{ Text = wezterm.nerdfonts.mdi_hexagon },
		},
		["zsh"] = {
			{ Text = wezterm.nerdfonts.dev_terminal },
		},
		["bash"] = {
			{ Text = wezterm.nerdfonts.cod_terminal_bash },
		},
		["htop"] = {
			{ Text = wezterm.nerdfonts.mdi_chart_donut_variant },
		},
		["cargo"] = {
			{ Text = wezterm.nerdfonts.dev_rust },
		},
		["go"] = {
			{ Text = wezterm.nerdfonts.mdi_language_go },
		},
		["lazydocker"] = {
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["git"] = {
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lazygit"] = {
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lua"] = {
			{ Text = wezterm.nerdfonts.seti_lua },
		},
		["wget"] = {
			{ Text = wezterm.nerdfonts.mdi_arrow_down_box },
		},
		["curl"] = {
			{ Text = wezterm.nerdfonts.mdi_flattr },
		},
		["gh"] = {
			{ Text = wezterm.nerdfonts.dev_github_badge },
		},
	}

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

	return wezterm.format(
		process_icons[process_name]
			or { { Foreground = { Color = colors.sky } }, { Text = string.format("[%s]", process_name) } }
	)
end

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "  ~"
		or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

wezterm.on("format-tab-title", function(tab)
	return wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = string.format(" %s  ", tab.tab_index + 1) },
		"ResetAttributes",
		{ Text = get_process(tab) },
		{ Text = " " },
		{ Text = get_current_working_dir(tab) },
		{ Foreground = { Color = colors.base } },
		{ Text = "  ▕" },
	})
end)

wezterm.on("update-right-status", function(window)
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Text = wezterm.strftime(" %A, %d %B %Y %I:%M %p ") },
	}))
end)

return {
	--[[ font = wezterm.font_with_fallback({
		"Caskaydia Cove Nerd Font Mono",
		"Apple Color Emoji",
	}), ]]
	color_scheme = 'Everblush',
	font_size = 11.3,
	max_fps = 120,
	enable_wayland = false,
	pane_focus_follows_mouse = false,
	warn_about_missing_glyphs = false,
	show_update_window = false,
	check_for_updates = false,
	line_height = 1.30,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	audible_bell = "Disabled",
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},
	initial_cols = 110,
	initial_rows = 25,
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 0.85,
	},
	enable_scroll_bar = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = true,
	window_background_opacity = 1.0,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = true,
	disable_default_key_bindings = false,
	front_end = "WebGpu",
	colors = {
tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        background = "#141b1e",

        -- The active tab is the one that has focus in the window
        active_tab = {
            -- The color of the background area for the tab
            bg_color = "#141b1e",
            -- The color of the text for the tab
            fg_color = "#fff",
            -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
            -- label shown for this tab.
            -- The default is "Normal"
            intensity = "Normal",

            -- Specify whether you want "None", "Single" or "Double" underline for
            -- label shown for this tab.
            -- The default is "None"
            underline = "None",

            -- Specify whether you want the text to be italic (true) or not (false)
            -- for this tab.  The default is false.
            italic = false,

            -- Specify whether you want the text to be rendered with strikethrough (true)
            -- or not for this tab.  The default is false.
            strikethrough = false
        },

        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
            bg_color = "#141b1e",
            fg_color = "#dadada"

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
            bg_color = "#8ad8ef",
            fg_color = "#22292b",
            italic = true

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab_hover`.
        },

        -- The new tab button that let you create new tabs
        new_tab = {
            bg_color = "#141b1e",
            fg_color = "#dadada"

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over the new tab button
        new_tab_hover = {
            bg_color = "#ce89df",
            fg_color = "#dadada",
            italic = true

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab_hover`.
        }

	},
	-- keys = {
	-- 	{
	-- 		mods = "ALT",
	-- 		key = [[\]],
	-- 		action = wezterm.action({
	-- 			SplitHorizontal = { domain = "CurrentPaneDomain" },
	-- 		}),
	-- 	},
	-- 	{
	-- 		mods = "ALT|SHIFT",
	-- 		key = [[|]],
	-- 		action = wezterm.action.SplitPane({
	-- 			top_level = true,
	-- 			direction = "Right",
	-- 			size = { Percent = 50 },
	-- 		}),
	-- 	},
	-- 	{
	-- 		mods = "ALT",
	-- 		key = [[-]],
	-- 		action = wezterm.action({
	-- 			SplitVertical = { domain = "CurrentPaneDomain" },
	-- 		}),
	-- 	},
	-- 	{
	-- 		mods = "ALT|SHIFT",
	-- 		key = [[_]],
	-- 		action = wezterm.action.SplitPane({
	-- 			top_level = true,
	-- 			direction = "Down",
	-- 			size = { Percent = 50 },
	-- 		}),
	-- 	},
	-- 	{
	-- 		key = "n",
	-- 		mods = "ALT",
	-- 		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	-- 	},
	-- 	{
	-- 		key = "Q",
	-- 		mods = "ALT",
	-- 		action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
	-- 	},
	-- 	{ key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	-- 	{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
	-- 	{ key = "F11", mods = "", action = wezterm.action.ToggleFullScreen },
	-- 	{ key = "h", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	-- 	{ key = "j", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	-- 	{ key = "k", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	-- 	{ key = "l", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
	--
	-- 	{ key = "h", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-left") },
	-- 	{ key = "j", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-down") },
	-- 	{ key = "k", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-up") },
	-- 	{ key = "l", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-right") },
	--
	-- 	{ key = "[", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	-- 	{ key = "]", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	-- 	{ key = "{", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
	-- 	{ key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
	-- 	{ key = "v", mods = "ALT", action = wezterm.action.ActivateCopyMode },
	-- 	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
	-- 	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	-- 	{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	-- 	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	-- 	{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
	-- 	{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
	-- 	{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
	-- 	{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },
	-- 	{ key = "5", mods = "ALT", action = wezterm.action({ ActivateTab = 4 }) },
	-- 	{ key = "6", mods = "ALT", action = wezterm.action({ ActivateTab = 5 }) },
	-- 	{ key = "7", mods = "ALT", action = wezterm.action({ ActivateTab = 6 }) },
	-- 	{ key = "8", mods = "ALT", action = wezterm.action({ ActivateTab = 7 }) },
	-- 	{ key = "9", mods = "ALT", action = wezterm.action({ ActivateTab = 8 }) },
	-- },
	-- hyperlink_rules = {
	-- 	{
	-- 		regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
	-- 		format = "$0",
	-- 	},
	-- 	{
	-- 		regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
	-- 		format = "$0",
	-- 	},
	-- 	{
	-- 		regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
	-- 		format = "mailto:$0",
	-- 	},
	-- 	{
	-- 		regex = [[\bfile://\S*\b]],
	-- 		format = "$0",
	-- 	},
	-- 	{
	-- 		regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
	-- 		format = "$0",
	-- 	},
	-- 	{
	-- 		regex = [[\b[tT](\d+)\b]],
	-- 		format = "https://example.com/tasks/?t=$1",
	-- 	},
	-- },
}}

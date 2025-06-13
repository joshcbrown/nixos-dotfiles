  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
local wezterm = require("wezterm")

local config = wezterm.config_builder()

local act = wezterm.action

config.color_scheme = "Tokyo Night Storm"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.window_close_confirmation = "NeverPrompt"

config.unix_domains = {
	{
		name = "unix",
	},
}

config.default_gui_startup_args = { "connect", "unix" }

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.keys = {
	-- Pane navigation (vim-style)
	{ key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },

	-- Pane splitting
	{ key = "-", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Tab navigation
	{ key = "{", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "}", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },

	-- Create new tab
	{ key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("DefaultDomain") },

	-- Close
	{ key = "x", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "q", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },

	{ key = "y", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },

	-- Session/Workspace related commands
	-- { key = "s", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace },
	-- { key = "n", mods = "CTRL|SHIFT", action = act.NewWorkspace },
	-- { key = "r", mods = "CTRL|SHIFT", action = act.RenameWorkspace },
	{ key = "c", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace({ name = "client" }) },
	{ key = "d", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace({ name = "default" }) },
	{ key = "f", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace({ name = "frontend" }) },
	{
		key = "c",
		mods = "ALT|SHIFT",
		action = wezterm.action_callback(function(win, pane)
			local tab, window = pane:move_to_new_window({ workspace = "client" })
		end),
	},
	{ key = "d", mods = "ALT|SHIFT", action = act.SwitchToWorkspace({ name = "default" }) },
	{ key = "f", mods = "ALT|SHIFT", action = act.SwitchToWorkspace({ name = "frontend" }) },
}

config.tab_bar_at_bottom = true

config.use_fancy_tab_bar = false

return config
    ''
  };

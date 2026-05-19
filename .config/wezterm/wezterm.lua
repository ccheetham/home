local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font('JetBrainsMonoNL Nerd Font Mono')
config.font_size = 16

config.initial_cols = 120
config.initial_rows = 32

config.color_scheme = 'Catppuccin Frappe'

config.hide_tab_bar_if_only_one_tab = true

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = act.PasteFrom 'PrimarySelection',
  },
}

return config

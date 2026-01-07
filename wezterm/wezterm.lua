local wezterm = require('wezterm')
local helpers = require('helpers')
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local config = wezterm.config_builder()
local osVal = helpers.osVal

-- Windowsのデフォルトプログラム設定
if helpers.is_win() then
  config.default_prog = { 'wsl', '-d', 'Ubuntu-24.04', '--cd', '~' }
end

config.color_scheme = 'tokyonight_night'
-- 現状initial_colsとinitial_rowsは外部ディスプレイでの起動時には正しく反映されない
-- https://github.com/wez/wezterm/issues/2958
-- (2025-02-19現在) 動いてそうなので一旦開放
config.initial_cols = 130
config.initial_rows = 40
config.window_background_opacity = 0.90
config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
tabline.setup({
  options = { theme = 'tokyonight_night' }
})

config.font = wezterm.font('HackGen Console NF')
config.font_size = osVal(15, 10, 10)

config.keys = require('keymap')
config.use_ime = true
config.macos_forward_to_ime_modifier_mask = "CTRL|SHIFT"

return config

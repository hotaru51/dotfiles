local wezterm = require('wezterm')
local helpers = require('helpers')
local act = wezterm.action

local osVal = helpers.osVal
local keys = {
  -- フルスクリーン
  {
    key = 'Enter',
    mods = osVal('CMD', 'CTRL', 'CTRL'),
    action = act.ToggleFullScreen
  },
  -- 新規タブ
  {
    key = 't',
    mods = osVal('CMD', 'CTRL|SHIFT', 'CTRL|SHIFT'),
    action = act.SpawnTab('DefaultDomain')
  },
  -- タブ移動
  {
    key = 'RightArrow',
    mods = osVal('CMD', 'CTRL', 'CTRL'),
    action = act.ActivateTabRelative(1)
  },
  {
    key = 'LeftArrow',
    mods = osVal('CMD', 'CTRL', 'CTRL'),
    action = act.ActivateTabRelative(-1)
  },
  -- 新規ウィンドウ
  {
    key = 'n',
    mods = osVal('CMD', 'CTRL|SHIFT', 'CTRL|SHIFT'),
    action = act.SpawnWindow
  },
  -- ペーン分割
  {
    key = 'o',
    mods = osVal('CMD|ALT', 'CTRL|ALT', 'CTRL|ALT'),
    action = act.SplitVertical
  },
  {
    key = 'i',
    mods = osVal('CMD|ALT', 'CTRL|ALT', 'CTRL|ALT'),
    action = act.SplitHorizontal
  },
  -- ペーン移動
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection('Left')
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection('Right')
  },
  {
    key = 'UpArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection('Up')
  },
  {
    key = 'DownArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection('Down')
  },
  -- ペーンを閉じる
  {
    key = 'w',
    mods = osVal('CMD', 'CTRL|SHIFT', 'CTRL|SHIFT'),
    action = act.CloseCurrentPane({ confirm = false })
  },
}

-- macOSの場合、 '¥' と '/' の入力を入れ替える
if helpers.is_mac() then
  local macos_keys = {
    {
      key = '¥',
      action = act.SendString('\\')
    },
    {
      key = '¥',
      mods = 'OPT',
      action = act.SendString('¥')
    }
  }

  for _, key in ipairs(macos_keys) do
    table.insert(keys, key)
  end
end

return keys

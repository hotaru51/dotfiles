local wezterm = require('wezterm')

local M = {}

local os = wezterm.target_triple

---macOSの場合trueを返す
---@return boolean
function M.is_mac()
  return os == 'x86_64-apple-darwin' or os == 'aarch64-apple-darwin'
end

---Windowsの場合tureを返す
---@return boolean
function M.is_win()
  return os == 'x86_64-pc-windows-msvc'
end

---Linuxの場合trueを返す
---@return boolean
function M.is_linux()
  return os == 'x86_64-unknown-linux-gnu'
end

---OSに対応した値を返す
---@param mac any
---@param win any
---@param lx any
---@return any
function M.osVal(mac, win, lx)
  if M.is_mac() then
    return mac
  elseif M.is_win() then
    return win
  elseif M.is_linux() then
    return lx
  else
    return nil
  end
end

return M

local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"

local lmash = {"cmd", "alt", "ctrl"}

local last_minimized = nil

------------------------------------
-- Window movement shortcuts
-- D - right
-- A - Left
-- W - Up
-- S - Down
-- TODO: use fnutils to merge them together
------------------------------------
hotkey.bind(lmash, "D", function()
  local win = window.focusedwindow()
  if win then
      local f = win:frame()
      f.x = f.x + 10
      win:setframe(f)
  end
end)

hotkey.bind(lmash, "A", function()
  local win = window.focusedwindow()
  if win then
      local f = win:frame()
      f.x = f.x - 10
      win:setframe(f)
  end
end)

hotkey.bind(lmash, "W", function()
  local win = window.focusedwindow()
  if win then
      local f = win:frame()
      f.y = f.y - 10
      win:setframe(f)
  end
end)

hotkey.bind(lmash, "S", function()
  local win = window.focusedwindow()
  if win then
      local f = win:frame()
      f.y = f.y + 10
      win:setframe(f)
  end
end)

------------------------------------
-- Window maximizing and minimizing
------------------------------------
-- Make window maximizied
hotkey.bind(lmash, "M", function()
  local win = window.focusedwindow()
  if win then
      win:maximize()
  elseif last_minimized and last_minimized:isminimized() then
      -- if window is not available then grab the last
      -- minimized window and try to maximize it
      last_minimized:unminimize()
      last_minimized:maximize()
      last_minimized = nil
  end
end)

-- Make window minimized
hotkey.bind(lmash, "N", function()
  local win = window.focusedwindow()
  if win then
      win:minimize()
      last_minimized = win
  end
end)

------------------------------------
--- Windowing of the current window
-- H - left
-- L- Right
-- J - Top
-- K - bottom
-- TODO: use fnutils to merge them together
------------------------------------

hotkey.bind(lmash, "H", function()
  local win = window.focusedwindow()
  if win then
      local frame = win:screen():frame()
      frame.x, frame.y = 0, 0
      frame.w = frame.w / 2
      win:setframe(frame)
  end
end)

hotkey.bind(lmash, "L", function()
  local win = window.focusedwindow()
  if win then
      local frame = win:screen():frame()
      frame.x, frame.y = frame.w / 2, 0
      frame.w = frame.w / 2
      win:setframe(frame)
  end
end)

hotkey.bind(lmash, "J", function()
  local win = window.focusedwindow()
  if win then
      local frame = win:screen():frame()
      frame.x, frame.y = 0, 0
      frame.h = frame.h / 2
      win:setframe(frame)
  end
end)

hotkey.bind(lmash, "K", function()
  local win = window.focusedwindow()
  if win then
      local frame = win:screen():frame()
      frame.x, frame.y = 0, frame.h / 2
      frame.h = frame.h / 2
      win:setframe(frame)
  end
end)


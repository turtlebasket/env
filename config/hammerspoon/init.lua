
wf=hs.window.filter

-- Open new / focus existing terminal window in current desktop space
hs.hotkey.bind({"cmd", "ctrl"}, "T", function()
	wf_iterm2 = wf.new(false):setAppFilter("iTerm2", {currentSpace=true})

	local wins = wf_iterm2:getWindows()
	local count = 0
	for _ in pairs(wins) do count = count + 1 end
	
	if (count > 0)
	then
		wf_iterm2:getWindows()[1]:focus()
	else
		hs.osascript.applescript([[
			tell application "iTerm"
				create window with default profile
				activate
			end tell
		]])
	end

end)

-- Open new / focus existing browser window in current desktop space
hs.hotkey.bind({"cmd", "ctrl"}, "W", function()
	local browser = "Brave Browser"

	wf_browser = wf.new(false):setAppFilter(browser, {currentSpace=true})

	local wins = wf_browser:getWindows()
	local count = 0
	for _ in pairs(wins) do count = count + 1 end
	
	if (count > 0)
	then
		wf_browser:getWindows()[1]:focus()
	else
		hs.osascript.applescript(string.format([[
			tell application "%s"
				make new window
				activate
			end tell
		]], browser))
	end

end)


-- Window-based application switcher
-- NOTE: This was a mistake
--
-- switcher = hs.window.switcher.new(hs.window.filter.new(false):setCurrentSpace(true):setDefaultFilter{})
-- hs.hotkey.bind('alt','tab','Next window',switcher.nextWindow)
-- hs.hotkey.bind('alt-shift','tab','Previous window',switcher.previousWindow)

-- Clear clipboard
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "C", function()
	hs.pasteboard.setContents("")
	hs.notify.new({title="Bazinga", informativeText="System clipboard has been cleared."}):send()
end)

-- The ShiftIt Alternative

units = {
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  upright50     = { x = 0.50, y = 0.00, w = 0.50, h = 0.50 },
  botright50    = { x = 0.50, y = 0.50, w = 0.50, h = 0.50 },
  upleft50      = { x = 0.00, y = 0.00, w = 0.50, h = 0.50 },
  botleft50     = { x = 0.00, y = 0.50, w = 0.50, h = 0.50 },
  maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
}

mash = { 'shift', 'ctrl', 'cmd' }
hs.hotkey.bind(mash, 'l', function() hs.window.focusedWindow():move(units.right50,    nil, true) end)
hs.hotkey.bind(mash, 'h', function() hs.window.focusedWindow():move(units.left50,     nil, true) end)
hs.hotkey.bind(mash, 'k', function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
hs.hotkey.bind(mash, 'j', function() hs.window.focusedWindow():move(units.bot50,      nil, true) end)
hs.hotkey.bind(mash, ']', function() hs.window.focusedWindow():move(units.upright50,  nil, true) end)
hs.hotkey.bind(mash, '[', function() hs.window.focusedWindow():move(units.upleft50,   nil, true) end)
hs.hotkey.bind(mash, ';', function() hs.window.focusedWindow():move(units.botleft50,  nil, true) end)
hs.hotkey.bind(mash, "'", function() hs.window.focusedWindow():move(units.botright50, nil, true) end)
hs.hotkey.bind(mash, 'm', function() hs.window.focusedWindow():move(units.maximum,    nil, true) end)

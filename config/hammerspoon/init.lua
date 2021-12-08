
wf=hs.window.filter
browser = "Brave Browser"

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


-- Open new / focus existing vscode window in current desktop space

hs.hotkey.bind({"cmd", "ctrl"}, "C", function()
	local app = "Code"

	wf_app = wf.new(false):setAppFilter(app, {currentSpace=true})

	local wins = wf_app:getWindows()
	local count = 0
	for _ in pairs(wins) do count = count + 1 end
	
	if (count > 0)
	then
		wf_app:getWindows()[1]:focus()
	else

		hs.osascript.applescript(string.format([[
			tell application "System Events" to tell process "%s"
			    click menu item "New Window" of menu "File" of menu bar 1
				set frontmost to true
			end tell
		]], app))

	end

end)

-- Open new / focus existing VimR window in current desktop space

hs.hotkey.bind({"cmd", "ctrl"}, "V", function()
	local app = "VimR"

	wf_app = wf.new(false):setAppFilter(app, {currentSpace=true})

	local wins = wf_app:getWindows()
	local count = 0
	for _ in pairs(wins) do count = count + 1 end
	
	if (count > 0)
	then
		wf_app:getWindows()[1]:focus()
	else

		hs.osascript.applescript(string.format([[
			tell application "System Events" to tell process "%s"
			    click menu item "New" of menu "File" of menu bar 1
				set frontmost to true
			end tell
		]], app))

	end

end)


-- Expose Windows (Mission Control)

hs.hotkey.bind({"alt"}, "tab", function() 
	hs.application.open("Mission Control"):activate()
end)

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


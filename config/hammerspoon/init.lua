wf=hs.window.filter
browser = "Brave Browser"
-- browser = "Chromium"

-- Open new / focus existing Finder window in current desktop space

hs.hotkey.bind({"cmd", "ctrl"}, "X", function()
	local app = "Finder"

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
				click menu item "New Finder Window" of menu "File" of menu bar 1
				set frontmost to true
			end tell
		]], app))
	end

end)

-- Open new / focus existing terminal window in current desktop space

-- hs.hotkey.bind({"cmd", "ctrl"}, "T", function()
--  	wf_kitty = wf.new(false):setAppFilter("kitty", {currentSpace=true, visible=true})
--  	local wins = wf_kitty:getWindows()
--  	local count = 0
--  	for _ in pairs(wins) do count = count + 1 end
-- 
--  	if (count > 0)
--  	then
--  		wf_kitty:getWindows()[1]:focus()
--  	else
--  		hs.osascript.applescript([[
-- 			tell application "System Events" to tell process "kitty"
-- 				click menu item "New OS Window" of menu "Shell" of menu bar 1
-- 			end tell
--  		]])
--  	end
-- end)

hs.hotkey.bind({"cmd", "ctrl"}, "T", function()
	wf_iterm2 = wf.new(false):setAppFilter("iTerm2", {currentSpace=true, visible=true})

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

	wf_browser = wf.new(false):setAppFilter(browser, {currentSpace=true, visible=true})

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

-- CHROMIUM-BASED BROWSERS ONLY: Open new tab to right of current browser

hs.hotkey.bind({"cmd", "option"}, "T", function()

	local focusedAppName = hs.window.focusedWindow():application():title()

	if focusedAppName == browser 
	then
		hs.osascript.applescript(string.format([[
			tell application "System Events" to tell process "%s"
				click menu item "New Tab to the Right" of menu "Tab" of menu bar 1
			end tell
		]], focusedAppName))
	else
		hs.notify.new({title=string.format("%s not focused.", browser)}):send()
	end

end)

-- Open new / focus existing vscode window in current desktop space

hs.hotkey.bind({"cmd", "ctrl"}, "V", function()
	local app = "Code"

	wf_app = wf.new(false):setAppFilter(app, {currentSpace=true, visible=true})

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

-- Open new / focus existing g/n/mac/vim(r) window in current desktop space

hs.hotkey.bind({"cmd", "ctrl"}, "E", function()
	local app = "VimR"

	wf_app = wf.new(false):setAppFilter(app, {currentSpace=true, visible=true})

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

-- APP-AGNOSTIC GLOBAL OPEN/FOCUS BINDINGS

hs.hotkey.bind({"cmd", "ctrl"}, "O", function() hs.application.open("Obsidian") end) 
hs.hotkey.bind({"cmd", "ctrl"}, "C", function() hs.application.open("Numi") end) 
hs.hotkey.bind({"cmd", "ctrl"}, "S", function() hs.application.open("Signal") end) 

-- Clear clipboard

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "C", function()
	hs.pasteboard.setContents("")
	hs.notify.new({title="Cleared clipboard."}):send()
end)


-------------------
-- A R C H I V E --
-------------------

-- Desktop Action Hotkeys (MOVED TO SYSTEM SETTINGS)

-- -- Show Desktop (like windows or KDE)
-- 
-- hs.hotkey.bind({"alt"}, "d", function()
-- 	hs.eventtap.keyStroke({"fn"}, "f11")
-- end)
-- 
-- -- Switch Desktops (like windows or KDE)
-- 
-- hs.hotkey.bind({"ctrl", "alt"}, "left", function()
-- 	hs.eventtap.keyStroke({"ctrl"}, "left")
-- end)
-- 
-- hs.hotkey.bind({"ctrl", "alt"}, "right", function()
-- 	hs.eventtap.keyStroke({"ctrl"}, "right")
-- end)
-- 
-- 
-- -- Expose Windows (Mission Control)
-- 
-- hs.hotkey.bind({"alt"}, "tab", function() 
-- 	hs.application.open("Mission Control"):activate()
-- end)


-- Move windows between displays

-- hs.hotkey.bind({"ctrl", "shift"}, "right", function()
-- 	hs.window.focusedWindow():moveToScreen(hs.screen:next())
-- end)
-- 
-- hs.hotkey.bind({"ctrl", "shift"}, "left", function()
-- 	hs.window.focusedWindow():moveToScreen(hs.screen:previous())
-- end)


-- The ShiftIt Alternative (MOVED TO RECTANGLE)

-- units = {
--   right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
--   right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
--   left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
--   left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
--   top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
--   bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
--   upright50     = { x = 0.50, y = 0.00, w = 0.50, h = 0.50 },
--   botright50    = { x = 0.50, y = 0.50, w = 0.50, h = 0.50 },
--   upleft50      = { x = 0.00, y = 0.00, w = 0.50, h = 0.50 },
--   botleft50     = { x = 0.00, y = 0.50, w = 0.50, h = 0.50 },
--   maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
-- }
-- 
-- mash = { 'shift', 'ctrl', 'cmd' }
-- hs.hotkey.bind(mash, 'l', function() hs.window.focusedWindow():move(units.right50,    nil, true) end)
-- hs.hotkey.bind(mash, 'h', function() hs.window.focusedWindow():move(units.left50,     nil, true) end)
-- hs.hotkey.bind(mash, 'k', function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
-- hs.hotkey.bind(mash, 'j', function() hs.window.focusedWindow():move(units.bot50,      nil, true) end)
-- hs.hotkey.bind(mash, ']', function() hs.window.focusedWindow():move(units.upright50,  nil, true) end)
-- hs.hotkey.bind(mash, '[', function() hs.window.focusedWindow():move(units.upleft50,   nil, true) end)
-- hs.hotkey.bind(mash, ';', function() hs.window.focusedWindow():move(units.botleft50,  nil, true) end)
-- hs.hotkey.bind(mash, "'", function() hs.window.focusedWindow():move(units.botright50, nil, true) end)
-- hs.hotkey.bind(mash, 'm', function() hs.window.focusedWindow():move(units.maximum,    nil, true) end)

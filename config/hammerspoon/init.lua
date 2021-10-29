
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


-- Window-based application switcher
switcher = hs.window.switcher.new(hs.window.filter.new(false):setCurrentSpace(true):setDefaultFilter{})
hs.hotkey.bind('alt','tab','Next window',switcher.nextWindow)
hs.hotkey.bind('alt-shift','tab','Previous window',switcher.previousWindow)

-- Clear clipboard
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "C", function()
	hs.pasteboard.setContents("")
	hs.notify.new({title="Bazinga", informativeText="System clipboard has been cleared."}):send()
end)

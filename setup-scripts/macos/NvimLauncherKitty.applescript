# Based on the iTerm script

on run {input, parameters}
	set myPath to POSIX path of input
	set cmd to "/opt/homebrew/bin/nvim -p " & quote & myPath & quote
	tell application "System Events" to tell process "kitty"
		click menu item "New Tab" of menu "Shell" of menu bar 1
	end tell
end run

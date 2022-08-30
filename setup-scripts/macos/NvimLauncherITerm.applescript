# From: https://gregrs-uk.github.io/2018-11-01/open-files-neovim-iterm2-macos-finder/
# Instructions: 
# - Create new application in Automator
# - Add "run applescript" step
# - Paste in the below script 
# From: https://gregrs-uk.github.io/2018-11-01/open-files-neovim-iterm2-macos-finder/
# Instructions: 
# - Create new application in Automator
# - Add "run applescript" step
# - Paste in the below script

on run {input, parameters}
	set myPath to POSIX path of input
	set cmd to "/opt/homebrew/bin/nvim -p " & quote & myPath & quote
	tell application "iTerm"
		activate
		tell current window
			create tab with default profile command cmd
		end tell
	end tell
end run

# Modified from: https://gist.github.com/charlietran/43639b0f4e0a01c7c20df8f1929b76f2?permalink_comment_id=2737814#gistcomment-2737814
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


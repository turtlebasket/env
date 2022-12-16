#!/bin/bash

# Disable mouse movement acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# Disable scrolling acceleration
defaults write .GlobalPreferences com.apple.scrollwheel.scaling -1

# Remind to logout 
echo To fully apply changes, log out and back in again.

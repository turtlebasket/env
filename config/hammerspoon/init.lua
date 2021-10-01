hs.hotkey.bind({"cmd", "shift", "ctrl"}, "C", function()
  hs.pasteboard.setContents("")
  hs.notify.new({title="Bazinga", informativeText="System clipboard has been cleared."}):send()
end)


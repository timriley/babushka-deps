dep "macos screenshots saved in directory", :path, :template => "plist" do
  domain "com.apple.screencapture"
  values "location" => path.to_s

  after {
    shell! "mkdir -p #{path.to_s}"
    shell! "killall SystemUIServer"
  }
end

dep "macos dock configured", :template => "plist" do
  domain "com.apple.dock"

  values \
    "orientation" => "left",
    "autohide" => true,
    "show-process-indicators" => false

  checks \
    "orientation" => "left",
    "autohide" => "1",
    "show-process-indicators" => "0"

  types Hash.new("string").update(
    "autohide" => "bool",
    "show-process-indicators" => "bool",
  )

  after {
    log_shell "Restarting Dock", %{osascript -e 'quit application "Dock"'}
  }
end

dep "macos configured" do
  requires "macos screenshots saved in directory".with(:path => "'~/Dropbox (Icelab)/Screenshots'")
  requires "macos dock configured"
  requires "macos menu bar hidden"
end

dep "macos screenshots saved in directory", :path, :template => "plist" do
  domain "com.apple.screencapture"

  values "location" => path.to_s
  checks "location" => path.to_s.sub(/^['"]/, "").sub(/['"]$/, "")

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

dep "macos menu bar hidden", :template => "plist" do
  domain "NSGlobalDomain"

  values "_HIHideMenuBar" => true
  types  "_HIHideMenuBar" => "bool"
  checks "_HIHideMenuBar" => "1"

  after {
    shell! "killall SystemUIServer"
  }
end

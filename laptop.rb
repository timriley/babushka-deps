dep "laptop" do
  # Build the standard Icelab environment
  requires "icelab:workstation"

  requires "personal"
end

dep "personal" do
  requires "personal dotfiles"

  # OS X configuration
  requires "os x configured"

  # Packages
  requires "ack.managed"
  requires "awscli.managed"
  requires "carthage.managed"
  requires "cloc.managed"
  requires "csvkit.pip"
  requires "ctags.managed"
  requires "fish.managed"
  requires "git-subrepo.managed"
  requires "graphviz.managed"
  requires "httpie.managed"
  requires "hub.managed"
  requires "jq.managed"
  requires "libdvdcss.managed"
  requires "mas.managed"
  requires "ne.managed"
  requires "ngrok"
  requires "pygments.py"
  requires "s3cmd.managed"
  requires "switchaudio-osx.managed"
  requires "watchman.managed"
  requires "wget.managed"

  # Apps
  requires "1password"
  requires "atext"
  requires "caffeine"
  requires "charles"
  requires "cloak"
  requires "dash"
  requires "doxie"
  requires "firefox"
  requires "firefoxdeveloperedition"
  requires "fluid"
  requires "flux"
  requires "gfxcardstatus"
  requires "iterm2"
  requires "rowanj-gitx"
  requires "gitter"
  requires "glueprint"
  requires "google-chrome"
  requires "gpgtools"
  requires "hammerspoon"
  requires "handbrake"
  requires "hazel"
  requires "imageoptim"
  requires "launchbar"
  requires "licecap"
  requires "openemu"
  requires "postico"
  requires "reveal"
  requires "slack"
  requires "skype"
  requires "superduper"
  requires "taskpaper"
  requires "tokens"
  requires "transmission"
  requires "transmit"
  requires "virtualbox"
  requires "visual-studio-code"
  requires "vlc"

  # LaunchBar actions
  requires "Caffeinate.lbaction"

  requires "vscode extensions"

  # Development tools
  requires "react-native-cli.npm"
  requires "packer.managed"

  # Use fish
  requires "icelab:shell".with :shell_name => "fish"
end

dep "os x configured" do
  requires "screenshots saved in directory".with(:path => "~/Desktop/Screenshots")
end

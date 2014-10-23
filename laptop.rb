dep "laptop" do
  # Build the standard Icelab environment
  requires "icelab:workstation"

  requires "workstation"
end

dep "workstation" do
  requires "personal dotfiles"

  # Packages
  requires "wget.managed"

  # Apps
  requires "caffeine"
  requires "charles"
  requires "cloak"
  requires "doxie"
  requires "firefox"
  requires "fluid"
  requires "flux"
  requires "gfxcardstatus"
  requires "gitx-rowanj"
  requires "google-chrome"
  requires "hazel"
  requires "imageoptim"
  requires "launchbar"
  requires "licecap"
  requires "mailplane"
  requires "openemu"
  requires "rdio"
  requires "reveal"
  requires "slack"
  requires "skype"
  requires "sublime-text3"
  requires "superduper"
  requires "taskpaper"
  requires "textexpander"
  requires "tokens"
  requires "transmission"
  requires "transmit"
  requires "onepassword"
  requires "tunnelbear"
  requires "virtualbox"
  requires "vlc"
end

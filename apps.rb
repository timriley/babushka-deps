def cask(name); dep name, :template => "icelab:cask"; end # Avoid repitition below

cask "caffeine"
cask "charles"
cask "cloak"
cask "doxie"
cask "firefox"
cask "fluid"
cask "flux"
cask "gfxcardstatus"
cask "gitx-rowanj"
cask "google-chrome"
cask "hazel"
cask "imageoptim"
cask "launchbar"
cask "licecap"
cask "mailplane"
cask "openemu"
cask "rdio"
cask "reveal"
cask "slack"
cask "skype"
dep "sublime-text3", :template => "icelab:cask" do requires "icelab:homebrew tap".with "caskroom/versions" end
cask "superduper"
cask "taskpaper"
cask "textexpander"
cask "tokens"
cask "transmission"
cask "transmit"
cask "tunnelbear"
cask "onepassword"
cask "virtualbox"
cask "vlc"


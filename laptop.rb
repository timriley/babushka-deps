dep "laptop bootstrapped" do
  # Install rcm from source first, to get a version with fixes for file names
  # with spaces (necessary until a version _after_ 1.3.1 is released).
  requires "rcm.src"

  requires "icelab:workstation bootstrapped"
end

dep "laptop" do
  # Build the standard Icelab environment
  requires "icelab:workstation"

  requires "personal"
end

dep "personal" do
  requires "personal dotfiles"

  # macOS configuration
  requires "macos configured"

  # Packages
  requires "ack.managed"
  requires "ansible.managed"
  requires "awscli.managed"
  requires "carthage.managed"
  requires "cloc.managed"
  requires "ctags.managed"
  requires "fish.managed"
  requires "graphviz.managed"
  requires "httpie.managed"
  requires "hub.managed"
  requires "jq.managed"
  requires "libdvdcss.managed"
  requires "mas.managed"
  requires "ne.managed"
  requires "ngrok"
  requires "pgcli.managed"
  requires "pygments.py"
  requires "s3cmd.managed"
  requires "switchaudio-osx.managed"
  requires "watchman.managed"
  requires "wget.managed"

  # Mac App Store apps
  requires "Byword.mas"
  requires "DaisyDisk.mas"
  requires "1Blocker.mas"
  requires "Day One.mas"
  requires "Deckset.mas"
  requires "Diptic.mas"
  requires "Divvy.mas"
  requires "FoldingText.mas"
  requires "HTTP Client.mas"
  requires "iA Writer.mas"
  requires "iBooks Author.mas"
  requires "iStat Mini.mas"
  requires "Keynote.mas"
  requires "Marked.mas"
  requires "Numbers.mas"
  requires "Pages.mas"
  requires "Pathology.mas"
  requires "Patterns.mas"
  requires "PDFpen.mas"
  requires "Pixelmator.mas"
  requires "Reeder.mas"
  requires "Shush.mas"
  requires "Sip.mas"
  requires "SiteSucker.mas"
  requires "Soulver.mas"
  requires "The Unarchiver.mas"
  requires "Things3.mas"
  requires "Tomato One.mas"
  requires "Tweetbot.mas"
  requires "Ulysses.mas"
  requires "Wunderlist.mas"
  requires "xScope.mas"
  requires "Yoink.mas"

  # Apps
  requires "1password"
  requires "atext"
  requires "caffeine"
  requires "charles"
  requires "cloak"
  requires "dash"
  requires "doxie"
  requires "firefox"
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
  requires "muzzle"
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
  requires "vagrant"
  requires "virtualbox"
  requires "visual-studio-code"
  requires "vlc"

  # LaunchBar
  requires "Caffeinate.lbaction"

  # Visual Studio Code
  requires "vscode extensions"

  # Development tools
  requires "react-native-cli.npm"

  # Use fish
  requires "icelab:shell".with :shell_name => "fish"
end

dep "macos configured" do
  requires "macos screenshots saved in directory".with(:path => "~/Desktop/Screenshots")
  requires "macos dock configured"
end

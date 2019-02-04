dep "apps" do
  requires "mac app store apps"
  requires "homebrew cask apps"
end

dep "mac app store apps" do
  requires "DaisyDisk.mas"
  requires "1Blocker.mas"
  requires "Diptic.mas"
  requires "Divvy.mas"
  requires "HTTP Client.mas"
  requires "iA Writer.mas"
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
  requires "Trello.mas"
  requires "Tweetbot.mas"
  requires "Ulysses.mas"
  requires "Wunderlist.mas"
  requires "xScope.mas"
  requires "Yoink.mas"
end

dep "homebrew cask apps" do
  requires "1password"
  requires "atext"
  requires "backblaze"
  requires "brave-browser"
  requires "caffeine"
  requires "charles"
  requires "dash"
  requires "deckset"
  requires "doxie"
  requires "dropbox"
  requires "firefox"
  requires "fluid"
  requires "flux"
  requires "gfxcardstatus"
  requires "iterm2"
  requires "gitter"
  requires "glueprint"
  requires "google-chrome"
  requires "gpg-suite"
  requires "hammerspoon"
  requires "handbrake"
  requires "hazel"
  requires "iina"
  requires "imageoptim"
  requires "java"
  requires "keybase"
  requires "launchbar"
  requires "mailmate"
  requires "muzzle"
  requires "licecap"
  requires "openemu"
  requires "paw"
  requires "postgres"
  requires "postico"
  requires "reveal"
  requires "skype"
  requires "slack"

  requires "sublime-merge"
  requires "superduper"
  requires "tokens"
  requires "transmission"
  requires "transmit"
  requires "vagrant"
  requires "virtualbox"
  requires "visual-studio-code"
  requires "vlc"
end

# Apps installed from the Mac App Store
meta :mas do
  accepts_value_for :name, :basename
  accepts_value_for :id

  template {
    requires "mas.managed"

    def installed?
      # Extract app names from lines like "413857545 Divvy (1.5.1)"
      installed_ids = `mas list`.split("\n").map { |line|
        match = line.match(/^(?<id>\d+)\s(?<name>.*)?\s\((?<version>[\d\.]+)\)$/)
        match[:id]
      }

      installed_ids.include?(id)
    end

    met? {
      installed = false

      # `mas list` takes a little while to catch up to a freshly installed app.
      # Try a few times.
      5.times do |i|
        installed = true and break if installed?
        sleep i * 2
      end

      installed
    }

    meet {
      log_shell "Installing #{name} via Mac App Store", "mas install #{id}"
    }
  }
end

dep("1Blocker.mas") { id "1107421413" }
dep("DaisyDisk.mas") { id "411643860" }
dep("Diptic.mas") { id "526546615" }
dep("Divvy.mas") { id "413857545" }
dep("HTTP Client.mas") { id "418138339" }
dep("iA Writer.mas") { id "775737590" }
dep("iStat Mini.mas") { id "927292435" }
dep("Keynote.mas") { id "409183694" }
dep("Marked.mas") { id "448925439" }
dep("Numbers.mas") { id "409203825" }
dep("Pages.mas") { id "409201541" }
dep("Pathology.mas") { id "877848776" }
dep("Patterns.mas") { id "429449079" }
dep("PDFpen.mas") { id "403624960" }
dep("Pixelmator.mas") { id "407963104" }
dep("Reeder.mas") { id "880001334" }
dep("Shush.mas") { id "496437906" }
dep("Sip.mas") { id "507257563" }
dep("SiteSucker.mas") { id "442168834" }
dep("Soulver.mas") { id "413965349" }
dep("The Unarchiver.mas") { id "425424353" }
dep("Things3.mas") { id "904280696" }
dep("Tomato One.mas") { id "907364780" }
dep("Trello.mas") { id "1278508951" }
dep("Tweetbot.mas") { id "557168941" }
dep("Ulysses.mas") { id "623795237" }
dep("Wunderlist.mas") { id "410628904" }
dep("xScope.mas") { id "447661441" }
dep("Yoink.mas") { id "457622435" }

# Apps installed from homebrew cask
def cask(name); dep name, :template => "icelab:cask"; end # Avoid repitition below

cask "1password"
cask "atext"
cask "backblaze"
cask "brave-browser"
cask "caffeine"
cask "charles"
cask "dash"
cask "deckset"
cask "doxie"
cask "dropbox"
cask "firefox"
cask "fluid"
cask "flux"
cask "gfxcardstatus"
cask "gitter"
cask "glueprint"
cask "google-chrome"
cask "gpg-suite"
cask "hammerspoon"
cask "handbrake"
cask "hazel"
cask "iina"
cask "imageoptim"
cask "iterm2"
cask "java"
cask "keybase"
cask "launchbar"
cask "licecap"
cask "mailmate"
cask "muzzle"
cask "openemu"
cask "paw"
cask "postgres"
cask "postico"
cask "reveal"
cask "skype"
cask "slack"
dep "sublime-merge.cask", :template => "icelab:cask" do
  installs "sublime-merge"
end
dep "sublime-merge" do
  requires \
    "sublime-merge.cask",
    "smerge bin symlinked"
end
cask "superduper"
cask "tokens"
cask "transmission"
cask "transmit"
cask "vagrant"
cask "virtualbox"
cask "visual-studio-code"
cask "vlc"

dep "smerge bin symlinked" do
  met? {
    "/usr/local/bin/smerge".p.exists?
  }

  meet {
    shell! "ln -s '/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge' /usr/local/bin"
  }
end

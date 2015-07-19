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
  requires "watchman.managed"
  requires "wget.managed"

  # Apps
  requires "atom"
  requires "caffeine"
  requires "charles"
  requires "cloak"
  requires "doxie"
  requires "firefox"
  requires "firefoxdeveloperedition"
  requires "fluid"
  requires "flux"
  requires "gfxcardstatus"
  requires "gitx-rowanj"
  requires "glueprint"
  requires "google-chrome"
  requires "hazel"
  requires "imageoptim"
  requires "launchbar"
  requires "licecap"
  requires "mailplane"
  requires "openemu"
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

  # LaunchBar actions
  requires "Caffeinate.lbaction"
  requires "Create New Swift Playground.lbaction"

  # Sublime Text 3 packages
  requires "AdvancedNewFile.subl_package"
  requires "CodeFormatter.subl_package"
  requires "CoffeeScript.subl_package"
  requires "ColorPicker.subl_package"
  requires "GitGutter.subl_package"
  requires "JSX.subl_package"
  requires "MarkdownEditing.subl_package"
  requires "PrettyJson.subl_package"
  requires "Ruby-Slim.subl_package"
  requires "SCSS.subl_package"
  requires "Sublime-HTMLPrettify.subl_package"
  requires "Sublime-Wrap-Plus.subl_package"
  requires "SublimeGit"
  requires "SublimeLinter.subl_package"
  requires "SublimeLinter-jshint.subl_package"
  requires "SublimeLinter-ruby.subl_package"
  requires "Theme - Soda.subl_package"
  requires "TomDoc.subl_package"
  requires "TrailingSpaces.subl_package"

  # Development
  requires "iojs 2.3.4"
  requires "react-native-cli.npm"
end

dep "os x configured" do
  requires "screenshots saved in directory".with(:path => "~/Desktop/Screenshots")
end

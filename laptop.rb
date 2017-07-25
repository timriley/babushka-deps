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
  requires "macos configured"
  requires "packages"
  requires "apps"

  # LaunchBar
  requires "Caffeinate.lbaction"

  # Visual Studio Code
  requires "vscode extensions"

  # Development tools
  requires "react-native-cli.npm"

  # Use fish
  requires "icelab:shell".with :shell_name => "fish"
end

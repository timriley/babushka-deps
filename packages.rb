dep "packages" do
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
  requires "overmind.managed"
  requires "pgcli.managed"
  requires "pygments.py"
  requires "s3cmd.managed"
  requires "switchaudio-osx.managed"
  requires "watchman.managed"
  requires "wget.managed"
end

dep "ack.managed"
dep "ansible.managed"
dep "awscli.managed" do
  installs "awscli"
  provides "aws"
end
dep "carthage.managed"
dep "cloc.managed"
dep "ctags.managed"
dep "fish.managed"
dep "graphviz.managed" do
  provides "dot"
end
dep "httpie.managed" do
  provides "http"
end
dep "hub.managed"
dep "jq.managed"
dep "libdvdcss.managed" do
  provides nil
end
dep "llvm35.managed" do # for building rbx with ruby-build
  requires "icelab:homebrew tap".with "homebrew/versions"
  provides "llvm-as-3.5"
end
dep "mas.managed"
dep "ne.managed"

dep "ngrok" do
  met? {
    "/usr/local/bin/ngrok".p.exists?
  }

  meet {
    Babushka::Resource.extract("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-darwin-amd64.zip") do |archive|
      "ngrok".p.copy "/usr/local/bin/ngrok"
    end
  }
end

dep "overmind.managed" do
  requires "tmux.managed"
end

dep "pgcli.managed"
dep "pygments.py"

# dep "homebrew rcm uninstalled" do
#   met? {
#     `brew list rcm` && $?.exitstatus > 0
#   }
#
#   meet {
#     shell "brew uninstall --force rcm"
#   }
# end

dep "mustache.gem"
dep "autoconf.managed"
dep "automake.managed"
dep "rcm.src" do
  # requires "homebrew rcm uninstalled"
  requires_when_unmet "mustache.gem"
  requires_when_unmet "autoconf.managed"
  requires_when_unmet "automake.managed"

  source "https://github.com/thoughtbot/rcm/archive/master.zip"
  provides "rcup"

  preconfigure {
    shell "./autogen.sh"
  }
end

dep "s3cmd.managed"
dep "switchaudio-osx.managed" do
  provides "SwitchAudioSource"
end
dep "tmux.managed"
dep "watchman.managed" # recommended for react-native
dep "wget.managed"

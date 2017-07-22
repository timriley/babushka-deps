# Tell babushka to look for pip2 instead of pip
module Babushka
  class PipHelper
    def self.package_binary
      "pip2"
    end
  end
end

dep "ack.managed"
dep "ansible.pip"
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
    Babushka::Resource.extract("https://dl.ngrok.com/ngrok_2.0.19_darwin_amd64.zip") do |archive|
      "ngrok".p.copy "/usr/local/bin/ngrok"
    end
  }
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
dep "watchman.managed" # recommended for react-native
dep "wget.managed"

dep "csvkit.pip" do
  provides "csvformat"
end

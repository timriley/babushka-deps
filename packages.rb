dep "ack.managed"
dep "awscli.managed" do
  installs "awscli"
  provides "aws"
end
dep "carthage.managed"
dep "cloc.managed"
dep "ctags.managed"
dep "fish.managed"
dep "git-subrepo.managed"
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

dep "pygments.py"

dep "s3cmd.managed"
dep "switchaudio-osx.managed" do
  provides "SwitchAudioSource"
end
dep "watchman.managed" # recommended for react-native
dep "wget.managed"

dep "csvkit.pip" do
  provides "csvformat"
end

dep "packer.managed"

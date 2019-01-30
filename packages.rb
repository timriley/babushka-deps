dep "packages" do
  requires "ack.managed"
  requires "awscli.managed"
  requires "cloc.managed"
  requires "duply.managed"
  requires "ffmpeg.managed"
  requires "fish.managed"
  requires "freetds.managed"
  requires "graphviz.managed"
  requires "httpie.managed"
  requires "hub.managed"
  requires "jq.managed"
  requires "libdvdcss.managed"
  requires "mas.managed"
  requires "ngrok"
  requires "overmind.managed"
  requires "pgcli.managed"
  requires "pygments.py"
  requires "s3cmd.managed"
  requires "wget.managed"
end

dep "ack.managed"
dep "awscli.managed" do
  installs "awscli"
  provides "aws"
end
dep "cloc.managed"
dep "duply.managed"
dep "ffmpeg.managed"
dep "fish.managed"
dep "freetds.managed" do
  provides "tsql"
end
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
dep "mas.managed"

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
dep "s3cmd.managed"
dep "tmux.managed"
dep "wget.managed"

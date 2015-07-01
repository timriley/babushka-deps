dep "screenshots saved in directory", :path, :template => "plist" do
  domain "com.apple.screencapture"
  values "location" => path.to_s

  after {
    shell! "mkdir -p #{path.to_s}"
    shell! "killall SystemUIServer"
  }
end

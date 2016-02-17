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

dep "watchman.managed" # recommended for react-native
dep "wget.managed"

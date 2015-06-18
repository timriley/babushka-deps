meta :lbaction do
  accepts_value_for :source

  def path
    "~/Library/Application Support/LaunchBar/Actions" / name
  end

  template {
    met? {
      path.p.exists?
    }

    meet {
      Babushka::Resource.download source, path
    }
  }
end

dep "Caffeinate.lbaction" do
  source "https://dl.dropboxusercontent.com/u/1094926/lbdist/Caffeinate.lbaction"
end

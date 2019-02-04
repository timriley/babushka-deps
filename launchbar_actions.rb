dep "launchbar actions" do
  requires "Caffeinate.lbaction"
end

meta :lbaction do
  accepts_value_for :source

  def actions_dir
    "~/Library/Application Support/LaunchBar/Actions".p
  end

  def path
     actions_dir / name
  end

  template {
    met? {
      path.p.exists?
    }

    meet {
      actions_dir.mkdir

      Babushka::Resource.extract(source) do |archive|
        Dir.glob("*.lbaction").first.p.copy path
      end
    }
  }
end

dep "Caffeinate.lbaction" do
  source "https://s3.amazonaws.com/public-launchbar-download/Caffeinate.lbaction"
end

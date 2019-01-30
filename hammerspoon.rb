dep "hammerspoon spoons" do
  # This is the only spoon requiring manual installation. It will manage the
  # installation of any other spoons I need.
  requires "SpoonInstall.spoon"
end

meta :spoon do
  accepts_value_for :source

  def spoons_dir
    "~/.hammerspoon/Spoons".p
  end

  def path
     spoons_dir / name
  end

  template {
    met? {
      path.p.exists?
    }

    meet {
      spoons_dir.mkdir

      Babushka::Resource.extract(source) do |archive|
        Dir.glob("*.spoon").first.p.copy path
      end
    }
  }
end

dep "SpoonInstall.spoon" do
  source "https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip"
end

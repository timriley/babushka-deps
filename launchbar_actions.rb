# Patch babushka's `Resource.extract` so it doesn't descend into the top level
# .lbaction directory automatically after extracting the archives.
#
# Remove once https://github.com/benhoskings/babushka/issues/326 is fixed.
module Babushka
  class Asset
    def content_subdir
      identity_dirs.reject {|dir|
        %w[app pkg bundle tmbundle prefPane lbaction].map {|i| # added `lbaction` here
          /\.#{i}$/
        }.any? {|dont_descend|
          dir[dont_descend]
        }
      }.first
    end
  end
end

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
      Babushka::Resource.extract(source) do |archive|
        Dir.glob("*.lbaction").first.p.copy path
      end
    }
  }
end

dep "Caffeinate.lbaction" do
  source "https://dl.dropboxusercontent.com/u/1094926/lbdist/Caffeinate.lbaction"
end

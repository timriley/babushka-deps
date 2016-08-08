def subl(name, &block) dep name, {:template => "icelab:subl_package"}, &block end # Avoid repitition below

subl "AdvancedNewFile.subl_package" do
  source "https://github.com/skuroda/Sublime-AdvancedNewFile"
end

subl "ApplySyntax.subl_package" do
  source "https://github.com/facelessuser/ApplySyntax"
end

subl "BetterFindBuffer.subl_package" do
  source "https://github.com/aziz/BetterFindBuffer"
end

subl "Better Ruby.subl_package" do
  source "https://github.com/fnando/better-ruby-for-sublime-text"
end

subl "CodeFormatter.subl_package" do
  source "https://github.com/akalongman/sublimetext-codeformatter"
end

subl "CoffeeScript.subl_package" do
  source "https://github.com/aponxi/sublime-better-coffeescript"
end

subl "ColorPicker.subl_package" do
  source "https://github.com/weslly/ColorPicker"
end

subl "Docker.subl_package" do
  source "https://github.com/asbjornenge/Docker.tmbundle"
end

subl "GitGutter.subl_package" do
  source "https://github.com/jisaacks/GitGutter"
end

subl "GotoWindow.subl_package" do
  source "https://github.com/ccampbell/sublime-goto-window.git"
end

subl "JSX.subl_package" do
  source "https://github.com/masondesu/Sublime-JSX"
end

subl "MarkdownEditing.subl_package" do
  source "https://github.com/SublimeText-Markdown/MarkdownEditing"
end

subl "PrettyJson.subl_package" do
  source "https://github.com/dzhibas/SublimePrettyJson"
end

subl "Ruby-Slim.subl_package" do
 source "https://github.com/slim-template/ruby-slim.tmbundle"
end

subl "SCSS.subl_package" do
  source "https://github.com/danro/SCSS-sublime"
end

subl "Sublime-HTMLPrettify.subl_package" do
  source "https://github.com/victorporof/Sublime-HTMLPrettify"
end

subl "Sublime-Wrap-Plus.subl_package" do
  source "https://github.com/ehuss/Sublime-Wrap-Plus"
end

dep "SublimeGit" do
  met? {
    "~/Library/Application Support/Sublime Text 3/Packages/SublimeGit".p.exists?
  }

  meet {
    target_dir = "~/Library/Application Support/Sublime Text 3/Packages/SublimeGit".p

    target_dir.mkdir

    Babushka::Resource.extract("https://release.sublimegit.net/SublimeGit.zip") do |archive|
      Dir.glob("*").each do |entry|
        target_path = target_dir / entry

        entry.p.copy target_path
      end
    end
  }
end

subl "SublimeLinter.subl_package" do
  source "https://github.com/SublimeLinter/SublimeLinter3"
end

subl "SublimeLinter-jshint.subl_package" do
  source "https://github.com/SublimeLinter/SublimeLinter-jshint"
end

subl "SublimeLinter-ruby.subl_package" do
  source "https://github.com/SublimeLinter/SublimeLinter-ruby"
end

subl "SublimeTableEditor.subl_package" do
  source "https://github.com/vkocubinsky/SublimeTableEditor"
end

subl "sublime-fish-shell.subl_package" do
  source "https://github.com/toru-hamaguchi/sublime-fish-shell"
end

subl "Theme - Soda.subl_package" do
  source "https://github.com/buymeasoda/soda-theme"
end

subl "TomDoc.subl_package" do
  source "https://github.com/brandonhilkert/TomDoc-Sublime"
end

subl "TrailingSpaces.subl_package" do
  source "https://github.com/SublimeText/TrailingSpaces"
end

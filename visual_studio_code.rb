meta :code_extension do
  accepts_value_for :name, :basename

  template {
    requires "visual-studio-code"

    met? {
      shell("code --list-extensions").split("\n").grep(basename).any?
    }

    meet {
      shell! "code", "--install-extension", basename
    }
  }
end

extensions = %w[
  sianglim.slim
  Orta.vscode-danger
  Rubymaniac.vscode-paste-and-indent
  ow.vscode-subword-navigation
  stkb.rewrap
].each do |ext|
  dep ext, :template => "code_extension"
end

dep "vscode ruby extension" do
  requires "icelab:repository".with \
    :path => "~/.vscode/extensions/vscode-ruby",
    :url => "https://github.com/ypresto/vscode-ruby.git",
    :branch => "add-symbols-provider"
end

dep "vscode extensions" do
  extensions.each do |ext|
    requires ext
  end

  requires "vscode ruby extension"
end

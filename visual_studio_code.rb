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
  HookyQR.beautify
  IBM.output-colorizer
  PeterJausovec.vscode-docker
  Rubymaniac.vscode-paste-and-indent
  donjayamanne.githistory
  doublefint.pgsql
  eamodio.gitlens
  esbenp.prettier-vscode
  jakelucas.code-file-nav
  keyring.Lua
  mdickin.markdown-shortcuts
  miguel-savignano.ruby-symbols
  ow.vscode-subword-navigation
  rebornix.Ruby
  sianglim.slim
  steve8708.Align
  stkb.rewrap
  timriley.theme-espressosoda
  wmaurer.change-case
].each do |ext|
  dep ext, :template => "code_extension"
end

dep "rebornix.Ruby", :template => "code_extension" do
  requires "debase.gem"
  requires "rcodetools.gem"
  requires "rubocop.gem"
  requires "ruby-debug-ide.gem"
end

dep "debase.gem" do provides nil end
dep "rcodetools.gem" do provides nil end
dep "rubocop.gem" do provides nil end
dep "ruby-debug-ide.gem" do provides nil end

dep "vscode extensions" do
  extensions.each do |ext|
    requires ext
  end

  requires "rebornix.Ruby"
end

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
  brofox86.theme-espresso-soda-light
  donjayamanne.githistory
  doublefint.pgsql
  eamodio.gitlens
  esbenp.prettier-vscode
  HookyQR.beautify
  IBM.output-colorizer
  jakelucas.code-file-nav
  karunamurti.haml
  keyring.Lua
  mdickin.markdown-shortcuts
  miguel-savignano.ruby-symbols
  ow.vscode-subword-navigation
  PeterJausovec.vscode-docker
  sianglim.slim
  steve8708.Align
  stkb.rewrap
  wmaurer.change-case
  ziyasal.vscode-open-in-github
].each do |ext|
  dep ext, :template => "code_extension"
end

dep "castwide.solargraph", :template => "code_extension" do
  requires "solargraph.gem"
end

dep "rebornix.Ruby", :template => "code_extension" do
  requires "debase.gem"
  requires "rubocop.gem"
  requires "ruby-debug-ide.gem"
end

dep "debase.gem" do provides nil end
dep "rubocop.gem" do provides nil end
dep "ruby-debug-ide.gem" do provides nil end
dep "solargraph.gem" do provides nil end

dep "vscode extensions" do
  extensions.each do |ext|
    requires ext
  end

  requires "castwide.solargraph"
  requires "rebornix.Ruby"
end

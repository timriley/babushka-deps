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
  brandoncc.vscode-seeing-is-believing
  brofox86.theme-espresso-soda-light
  donjayamanne.githistory
  doublefint.pgsql
  eamodio.gitlens
  esbenp.prettier-vscode
  fayras.simple-new-file
  GitHub.vscode-pull-request-github
  HookyQR.beautify
  IBM.output-colorizer
  jakelucas.code-file-nav
  karunamurti.haml
  keyring.Lua
  lunaryorn.fish-ide
  mdickin.markdown-shortcuts
  ow.vscode-subword-navigation
  PeterJausovec.vscode-docker
  rebornix.ruby
  RomanPeshkov.vscode-text-tables
  sianglim.slim
  skyapps.fish-vscode
  steve8708.Align
  stkb.rewrap
  tonsky.theme-alabaster
  wmaurer.change-case
  ziyasal.vscode-open-in-github
].each do |ext|
  dep ext, :template => "code_extension"
end

dep "castwide.solargraph", :template => "code_extension" do
  requires "solargraph.gem"
end

dep "vscode extensions" do
  extensions.each do |ext|
    requires ext
  end

  requires "castwide.solargraph"
end

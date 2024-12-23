# frozen_string_literal: true

default['homebrew']['owner'] = 'brew_owner'
default['homebrew']['taps'] = %w[
  esolitos/ipa
]

default['homebrew']['formulas'] = %w[
  asdf
  awscli
  binutils
  bison
  bzip2
  clang-format
  cmake
  cmigemo
  coreutils
  diffutils
  direnv
  docker
  docker-compose
  doxygen
  exiftool
  expect
  eza
  findutils
  fzf
  gdbm
  git
  git-delta
  git-lfs
  gnu-time
  gpg
  highlight
  imagemagick@6
  iproute2mac
  jo
  jq
  just
  libgccjit
  libiconv
  libgit2
  libmaa
  libmagic
  libpq
  libzip
  llvm
  make
  mecab
  mecab-ipadic
  midnight-commander
  mkcert
  ocrmypdf
  opencv
  pgrep
  pinentry-mac
  plantuml
  poppler
  qt
  re2c
  shellcheck
  swiftlint
  tesseract
  tesseract-lang
  the_silver_searcher
  tmux
  trash
  tree
  watch
  zlib
]

default['homebrew']['casks'] = %w[
  adobe-acrobat-reader
  alfred
  appcleaner
  arduino-ide
  azure-data-studio
  chef-workstation
  discord
  disk-inventory-x
  docker
  dotnet
  ebmac
  font-cascadia-code-nf
  ganttproject
  gimp
  hiddenbar
  inkscape
  iterm2
  karabiner-elements
  kicad
  meld
  rar
  qt-creator
  switchhosts
  tableplus
  vipriser
  visual-studio-code
  vnc-viewer
  webots
]

default['devenv']['user'] = 'user'
default['devenv']['group'] = 'group'

default['devenv']['.zsh.d']['repo'] = 'https://github.com/byplayer/dot.zsh.d.git'
default['devenv']['.zsh.d']['ref'] = 'main'
default['devenv']['.zsh.d']['checkout_branch'] = nil
default['devenv']['.zsh.d']['enable_checkout'] = false

default['devenv']['.git-extensions']['repo'] = 'https://github.com/byplayer/git-extensions.git'
default['devenv']['.git-extensions']['ref'] = 'main'
default['devenv']['.git-extensions']['checkout_branch'] = nil
default['devenv']['.git-extensions']['enable_checkout'] = false

default['devenv']['.highlight']['repo'] = 'https://github.com/byplayer/dot.highlight.git'
default['devenv']['.highlight']['ref'] = 'main'
default['devenv']['.highlight']['checkout_branch'] = nil
default['devenv']['.highlight']['enable_checkout'] = false

default['devenv']['.node_tool']['repo'] = 'https://github.com/byplayer/node_tool.git'
default['devenv']['.node_tool']['ref'] = 'main'
default['devenv']['.node_tool']['checkout_branch'] = nil
default['devenv']['.node_tool']['enable_checkout'] = false

# global
default['global']['version'] = '6.6.4'
default['global']['prefix'] = '/opt/global'
default['global']['configure_opt'] = '--with-exuberant-ctags=`which ctags`'

# git
default['devenv']['git']['user_name'] = 'devuser'
default['devenv']['git']['user_email'] = 'devuser@hogehoge.hogehoge'

# gpg
default['devenv']['gpg'] = {}

# updatedb
default['updatedb']['command'] = '/opt/homebrew/opt/findutils/libexec/gnubin/updatedb'
default['updatedb']['opts'] =
  '--prunepaths=\'/Users/*/Box /Users/*/Library /Users/*/.emacs.d/backup /Users/*/.emacs.d/undohist /Users/*/.emacs.d/undo-tree-hist /Users/*/.rbenv /Users/*/.nvm /Users/*/.chef /Users/*/.gem /Users/*/.go /Users/*/.gradle /Users/*/.inspect /Users/*/.bundle /Users/*/.npm /Users/*/.pyenv /Users/*/.sdkman /Users/*/.ruby_tool /Users/*/.berkshelf /Users/*/.node_tool /Users/*/.cargo /Users/*/.rustup /Users/*/chef /Users/*/.asdf /Users/startupuser\' --localpaths=/Users'

# golang
default['golang']['owner'] = 'root'
default['golang']['group'] = 'wheel'

# asdf
default['asdf']['plugins'] = {
  'nodejs' => 'https://github.com/asdf-vm/asdf-nodejs.git',
  'ruby' => 'https://github.com/asdf-vm/asdf-ruby.git'
}

default['asdf']['lang']['nodejs'] = ['16.14.1']
default['asdf']['lang']['ruby'] = ['3.1.0']

# source-han-code-jp
default['source-han-code-jp']['base_url'] =
  'https://github.com/adobe-fonts/source-han-code-jp/releases/download/'
default['source-han-code-jp']['version'] = '2.012R'

# ruby_tool
default['ruby_tool']['install_path'] = '/opt/ruby_tool'
default['ruby_tool']['repo'] = 'https://github.com/byplayer/ruby_tool.git'
default['ruby_tool']['ref'] = 'main'
default['ruby_tool']['checkout_branch'] = nil
default['ruby_tool']['enable_checkout'] = false

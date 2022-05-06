# frozen_string_literal: true

default['homebrew']['owner'] = 'brew_owner'
default['homebrew']['taps'] = %w[
  railwaycat/emacsmacport
  esolitos/ipa
]

default['homebrew']['formulas'] = %w[
  asdf
  aspell
  binutils
  bison
  bzip2
  clang-format
  cmake
  cmigemo
  coreutils
  diffutils
  docker
  docker-compose
  emacs-mac
  esolitos/ipa/sshpass
  exiftool
  findutils
  fzf
  git
  gpg
  highlight
  imagemagick
  iproute2mac
  jq
  just
  libgccjit
  libiconv
  libmaa
  libmagic
  libzip
  llvm
  logrotate
  midnight-commander
  mutagen-io/mutagen/mutagen-compose
  nginx
  opencv
  packer
  pgrep
  pinentry-mac
  plantuml
  pyenv-virtualenv
  pyenv-virtualenvwrapper
  qt
  re2c
  the_silver_searcher
  tmux
  tree
  virtualenv
  watch
]

default['homebrew']['casks'] = %w[
  alfred
  appcleaner
  bartender
  chef-workstation
  clipy
  docker
  ebmac
  ganttproject
  gimp
  iterm2
  jiggler
  meld
  rar
  rstudio
  qt-creator
  r
  scroll-reverser
  switchhosts
  tableplus
  vagrant
  viber
  visual-studio-code
  vnc-viewer
]

default['devenv']['user'] = 'user'
default['devenv']['group'] = 'group'

default['devenv']['.zsh.d']['repo'] = 'https://github.com/byplayer/dot.zsh.d.git'
default['devenv']['.zsh.d']['ref'] = 'main'
default['devenv']['.zsh.d']['checkout_branch'] = nil
default['devenv']['.zsh.d']['enable_checkout'] = false

default['devenv']['.emacs.d']['repo'] = 'https://github.com/byplayer/dot.emacs.d.git'
default['devenv']['.emacs.d']['ref'] = 'main'
default['devenv']['.emacs.d']['checkout_branch'] = nil
default['devenv']['.emacs.d']['enable_checkout'] = false

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

# lookup related
default['eb']['version'] = '4.4.3'
default['eb']['install_dir'] = '/opt/eb'

default['eblook']['version'] = '1.6.1+media-20150724'
default['eblook']['install_dir'] = '/opt/eblook'

# updatedb
default['updatedb']['command'] = '/usr/local/opt/findutils/libexec/gnubin/updatedb'
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

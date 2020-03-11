# frozen_string_literal: true

default['homebrew']['owner'] = 'brew_owner'
default['homebrew']['taps'] = %w[railwaycat/emacsmacport homebrew/science]
default['homebrew']['formulas'] = %w[
  aspell
  binutils
  cmake
  cmigemo
  coreutils
  diffutils
  docker
  docker-compose
  emacs-mac
  findutils
  fzf
  git
  gpg
  highlight
  libmaa
  llvm
  opencv
  pinentry-mac
  plantuml
  pyenv-virtualenv
  pyenv-virtualenvwrapper
  rbenv
  the_silver_searcher
  tmux
  watch
]
default['homebrew']['casks'] = %w[
  docker
]

default['devenv']['user'] = 'user'
default['devenv']['group'] = 'group'

default['devenv']['.zsh.d']['repo'] = 'https://github.com/byplayer/dot.zsh.d.git'
default['devenv']['.zsh.d']['ref'] = 'master'
default['devenv']['.zsh.d']['checkout_branch'] = nil
default['devenv']['.zsh.d']['enable_checkout'] = false

default['devenv']['.emacs.d']['repo'] = 'https://github.com/byplayer/dot.emacs.d.git'
default['devenv']['.emacs.d']['ref'] = 'master'
default['devenv']['.emacs.d']['checkout_branch'] = nil
default['devenv']['.emacs.d']['enable_checkout'] = false

default['devenv']['.git-extensions']['repo'] = 'https://github.com/muratayusuke/git-extensions.git'
default['devenv']['.git-extensions']['ref'] = 'master'
default['devenv']['.git-extensions']['checkout_branch'] = nil
default['devenv']['.git-extensions']['enable_checkout'] = false

default['devenv']['.ruby_tool']['repo'] = 'https://github.com/byplayer/ruby_tool.git'
default['devenv']['.ruby_tool']['ref'] = 'master'
default['devenv']['.ruby_tool']['checkout_branch'] = nil
default['devenv']['.ruby_tool']['enable_checkout'] = false

default['devenv']['.highlight']['repo'] = 'https://github.com/byplayer/dot.highlight.git'
default['devenv']['.highlight']['ref'] = 'master'
default['devenv']['.highlight']['checkout_branch'] = nil
default['devenv']['.highlight']['enable_checkout'] = false

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
default['updatedb']['opts'] = '--prunepaths=\'/Users/*/Box /Users/*/Library /Users/*/.emacs.d/backup /Users/*/.emacs.d/undohist /Users/*/.emacs.d/undo-tree-hist\' --localpaths=/Users'

# golang
default['golang']['owner'] = 'root'
default['golang']['group'] = 'wheel'

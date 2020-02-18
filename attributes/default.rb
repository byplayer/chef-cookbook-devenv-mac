# frozen_string_literal: true

default['homebrew']['owner'] = 'brew_owner'
default['homebrew']['taps'] = %w[d12frosted/emacs-plus]
default['homebrew']['formulas'] = %w[
  aspell
  binutils
  cmake
  cmigemo
  coreutils
  diffutils
  docker
  docker-compose
  emacs-plus
  findutils
  fzf
  git
  gpg
  highlight
  libmaa
  llvm
  pinentry-mac
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
default['updatedb']['prune_bind_mounts'] = 'yes'
default['updatedb']['prunenames'] = '.git .bzr .hg .svn'
default['updatedb']['prunepaths'] = '/tmp /private/tmp /var/spool /Applications'
default['updatedb']['prunefs'] = 'NFS nfs nfs4 rpc_pipefs afs binfmt_misc proc smbfs autofs iso9660 ncpfs coda devpts ftpfs devfs mfs shfs sysfs cifs lustre_lite tmpfs usbfs udf fuse.glusterfs fuse.sshfs curlftpfs ecryptfs fusesmb devtmpfs'

# golang
default['golang']['owner'] = 'root'
default['golang']['group'] = 'wheel'

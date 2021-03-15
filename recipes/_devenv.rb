# frozen_string_literal: true

devenv_user_home = "/Users/#{node['devenv']['user']}"

%w[.zsh.d
   .emacs.d
   .git-extensions
   .ruby_tool
   .highlight
   .node_tool].each do |name|
  git "#{devenv_user_home}/#{name}" do
    repository node['devenv'][name]['repo']
    reference node['devenv'][name]['ref']
    user node['devenv']['user']
    group node['devenv']['group']
    checkout_branch node['devenv'][name]['checkout_branch']
    enable_checkout node['devenv'][name]['enable_checkout']
    enable_submodules true
    action :sync
  end
end

execute 'install ruby_tool' do
  environment('HOME' => "/Users/#{node['devenv']['user']}")
  user node['devenv']['user']
  command <<-EOH
    cd ~/.ruby_tool && ./install.sh
  EOH
end

# install node_tool
bash 'install node tool' do
  cwd "/Users/#{node['devenv']['user']}"
  user node['devenv']['user']
  group node['devenv']['group']
  environment({ 'HOME' => "/Users/#{node['devenv']['user']}" })

  code <<-EOH
    cd .node_tool
    ./install.sh
  EOH
end

%W[
  #{devenv_user_home}/.config
  #{devenv_user_home}/.config/git
  #{devenv_user_home}/.config/mc
  #{devenv_user_home}/.gnupg
].each do |dir_name|
  directory dir_name do
    owner node['devenv']['user']
    group node['devenv']['group']
    mode '0700'
    recursive true
    action :create
  end
end

%w[
  .config/git/config
  .config/git/commit_template.txt
  .config/mc/mc.keymap
  .dir_colors
  .globalrc
  .prettierrc
  .textlintrc
  .tmux.conf
  .zshenv
  .zshrc
].each do |name|
  template "#{devenv_user_home}/#{name}" do
    source "#{name}.erb"
    owner node['devenv']['user']
    group node['devenv']['group']
    variables git_user_name: node['devenv']['git']['user_name'],
              git_user_email: node['devenv']['git']['user_email'],
              git_signing_key: node['devenv']['git']['signing_key'],
              git_private_user_name: node['devenv']['git']['private_user_name'],
              git_private_user_email: node['devenv']['git']['private_user_email'],
              git_private_signing_key: node['devenv']['git']['private_signing_key'],
              gpg_default_key: node['devenv']['gpg']['default_key']
    mode '0600'
    action :create
  end
end

%w[
  .private_git_conf.sh
].each do |name|
  template "#{devenv_user_home}/#{name}" do
    source "#{name}.erb"
    owner node['devenv']['user']
    group node['devenv']['group']
    variables git_user_name: node['devenv']['git']['user_name'],
              git_user_email: node['devenv']['git']['user_email'],
              git_signing_key: node['devenv']['git']['signing_key'],
              git_private_user_name: node['devenv']['git']['private_user_name'],
              git_private_user_email: node['devenv']['git']['private_user_email'],
              git_private_signing_key: node['devenv']['git']['private_signing_key'],
              gpg_default_key: node['devenv']['gpg']['default_key']
    mode '0755'
    action :create
  end
end

%w[
  .gnupg/gpg.conf
  .gnupg/gpg-agent.conf
].each do |name|
  template "#{devenv_user_home}/#{name}" do
    source "#{name}.erb"
    owner node['devenv']['user']
    group node['devenv']['group']
    variables git_user_name: node['devenv']['git']['user_name'],
              git_user_email: node['devenv']['git']['user_email'],
              git_signing_key: node['devenv']['git']['signing_key'],
              git_private_user_name: node['devenv']['git']['private_user_name'],
              git_private_user_email: node['devenv']['git']['private_user_email'],
              git_private_signing_key: node['devenv']['git']['private_signing_key'],
              gpg_default_key: node['devenv']['gpg']['default_key']
    action :create
  end
end

# for pyenv
%W[
  #{devenv_user_home}/.pyenv
].each do |dir_name|
  directory dir_name do
    owner node['devenv']['user']
    group node['devenv']['group']
    mode '0755'
    recursive true
    action :create
  end
end

link "#{devenv_user_home}/.pyenv/bin" do
  to '/usr/local/opt/pyenv/bin'
  link_type :symbolic
end

# sdkman
bash 'install sdkman' do
  cwd devenv_user_home
  user node['devenv']['user']
  group node['devenv']['group']
  environment({ 'HOME' => devenv_user_home })

  code <<-EOH
    curl -s "https://get.sdkman.io" | bash
  EOH
  not_if "test -f #{devenv_user_home}/.sdkman/bin/sdkman-init.sh"
end

# rust environment
bash 'install rust environment' do
  cwd devenv_user_home
  user node['devenv']['user']
  group node['devenv']['group']
  environment({ 'HOME' => devenv_user_home })

  code <<-EOH
    curl https://sh.rustup.rs -sSf | bash -s -- -y --no-modify-path --profile default
  EOH
end

# nvm
bash 'install nvm' do
  cwd devenv_user_home
  user node['devenv']['user']
  group node['devenv']['group']
  environment({ 'HOME' => devenv_user_home })

  code <<-EOH
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  EOH
end

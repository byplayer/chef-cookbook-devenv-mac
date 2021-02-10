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
  .globalrc
  .prettierrc
  .private_git_conf.sh
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
              gpg_default_key: node['devenv']['gpg']['default_key']
    action :create
  end
end

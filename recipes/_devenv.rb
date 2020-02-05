# frozen_string_literal: true

devenv_user_home = "/Users/#{node['devenv']['user']}"
%w[.zsh.d
   .emacs.d
   .git-extensions
   .ruby_tool
   .highlight].each do |name|
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
  environment('HOME' => "/Users/#{node['rbenv']['user']}")
  user node['rbenv']['user']
  command <<-EOH
    cd ~/.ruby_tool && ./install.sh
  EOH
end

%w[
  .tmux.conf
].each do |name|
  template "#{devenv_user_home}/#{name}" do
    source "#{name}.erb"
    owner nodenode['devenv']['user']
    group nodegroup node['devenv']['group']
    variables git_user_name: node['devenv']['git']['user_name'],
              git_user_email: node['devenv']['git']['user_email'],
              git_signing_key: node['devenv']['git']['signing_key'],
              gpg_default_key: node['devenv']['gpg']['default_key']
    action :create
  end
end

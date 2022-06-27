# frozen_string_literal: true

devenv_user_home = "/Users/#{node['devenv']['user']}"

%w[.zsh.d
   .git-extensions
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
  #{devenv_user_home}/.ssh
  #{devenv_user_home}/.ssh/config.d
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
  .asdfrc
  .config/git/config
  .config/git/commit_template.txt
  .config/mc/mc.keymap
  .dir_colors
  .globalrc
  .prettierrc
  .ssh/config
  .ssh/config.d/localhost.conf
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
  .loopback.sh
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
  .gnupg/dirmngr.conf
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

node['asdf']['plugins'].each do |p|
  bash "install asdf plugin:#{p}" do
    cwd devenv_user_home
    user node['devenv']['user']
    group node['devenv']['group']
    environment({ 'HOME' => devenv_user_home })

    code <<-EOH
      $(brew --prefix asdf)/libexec/asdf.sh
      if [ -d ~/.asdf/plugins/#{p} ]; then
        echo asdf plugin #{p} is already installed
      else
        asdf plugin add #{p}
      fi
    EOH
  end
end

# update asdf all plugins just in case
bash 'update asdf all plugins' do
  cwd devenv_user_home
  user node['devenv']['user']
  group node['devenv']['group']
  environment({ 'HOME' => devenv_user_home })

  code <<-EOH
      $(brew --prefix asdf)/libexec/asdf.sh
      asdf plugin update --all
  EOH
end

# expect node['asdf']['lang']["#{tool_name}"]["#{version}"]
node['asdf']['lang'].each do |lang, versions|
  versions.each do |v, opts|
    env_val = { 'HOME' => devenv_user_home }
    if opts
      opts.each do |k, v|
        env_val[k] = v
      end
    end

    bash "install #{lang} version:#{v}" do
      cwd devenv_user_home
      user node['devenv']['user']
      group node['devenv']['group']
      environment(env_val)

      code <<-EOH
        $(brew --prefix asdf)/libexec/asdf.sh
        asdf install #{lang} #{v}
      EOH
    end
  end
end

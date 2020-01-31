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

bash 'install ruby_tool' do
  environment('HOME' => "/Users/#{node['rbenv']['user']}")
  user node['rbenv']['user']
  code <<-EOH
    cd ~/.ruby_tool
    ./install.sh
  EOH
end

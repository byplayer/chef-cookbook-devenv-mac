# frozen_string_literal: true

include_recipe 'homebrew::install_taps'
include_recipe 'homebrew::install_formulas'
include_recipe 'homebrew::install_casks'

%w[
  logrotate
].each do |service|
  bash "start service[#{service}]" do
    user node['devenv']['user']
    code "brew services start #{service}"
  end
end

%w[
  /usr/local/etc/logrotate.d/nginx
].each do |t|
  template t do
    source "#{t}.erb"
    owner node['devenv']['user']
    group 'admin'
    mode '0644'
    action :create
  end
end

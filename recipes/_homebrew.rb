# frozen_string_literal: true

class Chef
  class Resource
    class HomebrewTap < Chef::Resource
      Chef::DelayedEvaluator.new(&block)
      property :homebrew_path, String,
               describe: 'homebrew path fix version',
               default: Chef::DelayedEvaluator.new { "#{HomebrewWrapper.new.install_path}/bin/brew" }
    end
  end
end

include_recipe 'homebrew::install_taps'
include_recipe 'homebrew::install_formulas'
include_recipe 'homebrew::install_casks'

%w[
  logrotate
].each do |service|
  bash "restart service[#{service}]" do
    user node['devenv']['user']
    code "brew services restart #{service}"
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

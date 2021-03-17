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

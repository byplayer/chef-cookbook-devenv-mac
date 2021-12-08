git node['ruby_tool']['install_path'] do
  repository node['ruby_tool']['repo']
  reference node['ruby_tool']['ref']
  checkout_branch node['ruby_tool']['checkout_branch']
  enable_checkout node['ruby_tool']['enable_checkout']
  enable_submodules true
  action :sync
end

execute 'install ruby_tool' do
  command <<-END_OF_COMMAND
    cd #{node['ruby_tool']['install_path']}
    ./install.sh
  END_OF_COMMAND
end

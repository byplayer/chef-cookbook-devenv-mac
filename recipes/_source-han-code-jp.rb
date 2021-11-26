file_url = "#{node['source-han-code-jp']['base_url']}/#{node['source-han-code-jp']['version']}/SourceHanCodeJP.ttc"
cache_file_name = "#{node['source-han-code-jp']['version']}_SourceHanCodeJP.ttc"
devenv_user_home = "/Users/#{node['devenv']['user']}"

remote_file "#{Chef::Config['file_cache_path']}/#{cache_file_name}" do
  source file_url
  mode 0o0644
  not_if "test -f #{Chef::Config['file_cache_path']}/#{cache_file_name}"
end

directory "#{devenv_user_home}/library/fonts" do
    owner node['devenv']['user']
    group node['devenv']['group']
    mode '0755'
    recursive true
    action :create
end

bash "install source-han-code-jp #{node['source-han-code-jp']['version']}" do
  cwd Chef::Config['file_cache_path']
  code <<-CODE
    if [ -f #{devenv_user_home}/Library/fonts/SourceHanCodeJP.ttc ]; then
      rm #{devenv_user_home}/library/fonts/SourceHanCodeJP.ttc
    fi

    cp #{cache_file_name} #{devenv_user_home}/library/fonts/SourceHanCodeJP.ttc
  CODE
end

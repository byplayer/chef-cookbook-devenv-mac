dir_name = node['source-han-code-jp']['version']
archive_name = "#{dir_name}.tar.gz"
file_url = "#{node['source-han-code-jp']['base_url']}/#{dir_name}.tar.gz"
devenv_user_home = "/Users/#{node['devenv']['user']}"

remote_file "#{Chef::Config['file_cache_path']}/#{archive_name}" do
  source file_url
  mode 0o0644
  not_if "test -f #{Chef::Config['file_cache_path']}/#{archive_name}"
end

bash "install source-han-code-jp #{dir_name}" do
  cwd Chef::Config['file_cache_path']
  code <<-CODE
    if [ -d source-han-code-jp-#{dir_name} ]; then
      rm -r source-han-code-jp-#{dir_name}
    fi

    if [ -f #{devenv_user_home}/library/fonts/SourceHanCodeJP.ttc ]; then
      rm #{devenv_user_home}/library/fonts/SourceHanCodeJP.ttc
    fi

    tar xzf #{archive_name}
    cp source-han-code-jp-#{dir_name}/OTC/SourceHanCodeJP.ttc #{devenv_user_home}/library/fonts/
  CODE
end

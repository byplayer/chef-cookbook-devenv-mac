# frozen_string_literal: true

# build lookup related tools

# need to install libmaa by homebrew

# eb
remote_file "#{Chef::Config['file_cache_path']}/eb-#{node['eb']['version']}.tar.bz2" do
  source "ftp://ftp.sra.co.jp/pub/misc/eb/eb-#{node['eb']['version']}.tar.bz2"
  mode 0o0644
  not_if "test -f #{Chef::Config['file_cache_path']}/eb-#{node['eb']['version']}.tar.bz2"
end

bash "install eb #{node['eb']['version']}" do
  cwd Chef::Config['file_cache_path']
  code <<-CODE
    if [ -s #{node['eb']['install_dir']} ]; then
      rm #{node['eb']['install_dir']}
    fi

    if [ -d eb-#{node['eb']['version']} ]; then
      rm -r eb-#{node['eb']['version']}
    fi

    tar xjf eb-#{node['eb']['version']}.tar.bz2
    cd eb-#{node['eb']['version']}
    sh ./configure --prefix=#{node['eb']['install_dir']}-#{node['eb']['version']}
    make
    make install

    ln -s #{node['eb']['install_dir']}-#{node['eb']['version']} #{node['eb']['install_dir']}
  CODE
  not_if "test -d #{node['eb']['install_dir']}-#{node['eb']['version']}"
end

# eblook

# lookup+media

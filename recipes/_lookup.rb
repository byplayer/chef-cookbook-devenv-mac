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
remote_file "#{Chef::Config['file_cache_path']}/eblook-#{node['eblook']['version']}.tar.gz" do
  source "http://ikazuhiro.s206.xrea.com/filemgmt_data/files/eblook-#{CGI.escape(node['eblook']['version'])}.tar.gz"
  mode 0o0644
  not_if "test -f #{Chef::Config['file_cache_path']}/eblook-#{node['eblook']['version']}.tar.gz"
end

bash "install eblook #{node['eblook']['version']}" do
  cwd Chef::Config['file_cache_path']
  code <<-CODE
    if [ -s #{node['eblook']['install_dir']} ]; then
      rm #{node['eblook']['install_dir']}
    fi

    if [ -d eblook-#{node['eblook']['version']} ]; then
      rm -r eblook-#{node['eblook']['version']}
    fi

    tar xzf eblook-#{node['eblook']['version']}.tar.gz
    cd eblook-#{node['eblook']['version']}
    ./configure --with-eb-conf=#{node['eb']['install_dir']}/etc/eb.conf \
      --prefix=#{node['eblook']['install_dir']}-#{node['eblook']['version']}
    make
    make install

    ln -s #{node['eblook']['install_dir']}-#{node['eblook']['version']} #{node['eblook']['install_dir']}
  CODE

  not_if "test -d #{node['eblook']['install_dir']}-#{node['eblook']['version']}"
end

# http://ikazuhiro.s206.xrea.com/filemgmt_data/files/eblook-1.6.1%2Bmedia-20150724.tar.gz

# lookup+media

# frozen_string_literal: true

template '/etc/updatedb.conf' do
  source 'etc/updatedb.conf.erb'
  owner 'root'
  mode '0644'
end

cron 'updatedb' do
  minute '0'
  user 'root'
  command 'updatedb'
end

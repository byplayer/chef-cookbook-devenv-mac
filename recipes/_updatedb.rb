# frozen_string_literal: true

template '/etc/updatedb.conf' do
  source 'etc/updatedb.conf.erb'
  owner 'root'
  group 'root'
end

cron 'updatedb' do
  minute '0'
  user 'root'
  command 'updatedb'
end

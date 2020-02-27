# frozen_string_literal: true

cron 'updatedb' do
  minute '0'
  user 'root'
  command "#{node['updatedb']['command']} #{node['updatedb']['opts']} > /var/log/updatedb.log 2>&1"
end

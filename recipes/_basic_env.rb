# frozen_string_literal: true

directory '/etc/profile.d' do
  action :create
  recursive true
  owner node['golang']['owner']
  group node['golang']['group']
  mode 0o0755
end

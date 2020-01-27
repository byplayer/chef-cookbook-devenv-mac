#
# Cookbook:: devenv-mac
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
%w[homebrew].each do |cookbook|
  include_recipe cookbook
end

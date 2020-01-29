#
# Cookbook:: devenv-mac
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
%w[
  homebrew
  homebrew::install_formulas
  devenv-mac::_homebrew
  devenv-mac::_devenv
  devenv-mac::_rbenv
].each do |cookbook|
  include_recipe cookbook
end

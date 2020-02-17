# frozen_string_literal: true

#
# Cookbook:: devenv-mac
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
%w[
  homebrew
  devenv-mac::_homebrew
  devenv-mac::_rbenv
  global
  devenv-mac::_lookup
  devenv-mac::_updatedb
  devenv-mac::_devenv
].each do |cookbook|
  include_recipe cookbook
end

# frozen_string_literal: true

#
# Cookbook:: devenv-mac
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
%w[
  devenv-mac::_source-han-code-jp
  devenv-mac::_homebrew
  devenv-mac::_basic_env
  devenv-mac::_loopback
  universal-ctags
  global
  golang
  devenv-mac::_updatedb
  devenv-mac::_devenv
  devenv-mac::_ruby_tool
].each do |cookbook|
  include_recipe cookbook
end

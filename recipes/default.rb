# frozen_string_literal: true

#
# Cookbook:: devenv-mac
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
%w[
  devenv-mac::_homebrew
  devenv-mac::_rbenv
  devenv-mac::_basic_env
  devnenv-mac::_loopback
  devenv-mac::_emacs
  universal-ctags
  global
  golang
  devenv-mac::_lookup
  devenv-mac::_updatedb
  devenv-mac::_devenv
].each do |cookbook|
  include_recipe cookbook
end

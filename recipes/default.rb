# frozen_string_literal: true

#
# Cookbook:: devenv-mac
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
%w[
  homebrew
  homebrew::install_formulas
  devenv-mac::_homebrew
  devenv-mac::_rbenv
  devenv-mac::_devenv
].each do |cookbook|
  include_recipe cookbook
end

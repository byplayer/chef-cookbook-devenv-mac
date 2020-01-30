# frozen_string_literal: true

node['homebrew']['taps'].each do |name|
  homebrew_tap name
end

include_recipe 'homebrew::install_formulas'

node['homebrew']['casks'].each do |name|
  homebrew_cask name
end

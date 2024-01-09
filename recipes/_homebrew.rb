# frozen_string_literal: true

include_recipe 'homebrew::install_taps'
include_recipe 'homebrew::install_formulas'

node['homebrew']['casks'].each do |name|
  cask(name) do
    action :install
    install_cask false
  end
end

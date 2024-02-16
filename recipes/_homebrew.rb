# frozen_string_literal: true

include_recipe 'homebrew::install_taps'
include_recipe 'homebrew::install_formulas'

node['homebrew']['casks'].each do |name|
  homebrew_cask name do
    action :install
    install_cask false
  end
end

# g++ link
Dir.glob("#{HomebrewWrapper.new.homebrew_path}/gcc/bin/g++*") do |f|
  bash 'create g++ symlink' do
    code <<-EOH
      ln -s #{f} #{HomebrewWrapper.new.homebrew_path}/gcc/bin/g++
    EOH
  end
end

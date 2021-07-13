# make link under applications

homebrew_tap node['emacs']['tap']

homebrew_cask node['emacs']['cask']['name'] do
  cask_name node['emacs']['cask']['name']
  options node['emacs']['cask']['options']
end

bash 'link emacs app' do
  code <<-EOH
    if [ -s /Applications/Emacs.app ] ; then
      rm /Applications/Emacs.app
    fi
    ln -s /usr/local/opt/#{node['emacs']['cask']['name']}/Emacs.app /Applications
  EOH
end

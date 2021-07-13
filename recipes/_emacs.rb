# make link under applications
bash 'link emacs app' do
  code <<-EOH
    if [ -s /Applications/Emacs.app ] ; then
      rm /Applications/Emacs.app
    fi
    ln -s /usr/local/opt/emacs-plus@28/Emacs.app /Applications
  EOH
end

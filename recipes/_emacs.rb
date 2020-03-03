# make link under applications
bash 'link emacs app' do
  comamnd <<-EOH
    if [ -s /Applications/Emacs.app ] ; then
      rm /Applications/Emacs.app
    fi
    ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications
  EOH
end

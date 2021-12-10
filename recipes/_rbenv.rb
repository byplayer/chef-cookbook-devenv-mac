# frozen_string_literal: true

node['rbenv']['rubies'].each do |version, gems|
  cmd = <<-EOH
    export RBENV_ROOT=/opt/rbenv
    eval "$(rbenv init -)" || true
    rbenv versions | grep #{version} > /dev/null
    RES=$?
    if [ $RES -eq 0 ]; then
      echo skip install ruby #{version}. It has been installed.
    else
      rbenv install #{version}
    fi
    rbenv shell #{version}
  EOH

  gems ||= []
  gems.each do |gem|
    cmd << "gem install #{gem}\n"
  end

  bash "install ruby(#{version}) gems(#{gems.join(',')}) by rbenv" do
    code cmd
  end
end

node['rbenv']['rubies'].each do |version, gems|
  cmd = <<-EOH
    eval "$(rbenv init -)"
    RES=$(rbenv versions | grep #{version})
    if [ $RES -eq 0 ]; then
      exit 0
    fi

    rbenv install #{version}
    rbenv shell #{version}
  EOH

  gems ||= []
  gems.each do |gem|
    cmd << "gem install #{gem}\n"
  end

  bash "install ruby(#{version}) by rbenv" do
    environment {'HOME' => "/Users/#{node['rbenv']['user']}"}
    user node['rbenv']['user']
    code cmd
  end
end

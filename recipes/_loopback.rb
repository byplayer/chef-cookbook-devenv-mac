(2..100).each do |i|
  ip = "127.0.0.#{i}"
  bash "install loopback: #{ip}" do
    code <<-EOH
    ifconfig lo0 alias #{ip} up
    EOH
    not_if "ifconfig | grep #{ip}"
  end
end

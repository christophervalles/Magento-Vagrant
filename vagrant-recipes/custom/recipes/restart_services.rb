service "apache2" do
  action :restart
end

service "mysql" do
  action :restart
end

service "memcached" do
  action :restart
end
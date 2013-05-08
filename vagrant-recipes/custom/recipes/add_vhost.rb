template "#{node['apache']['dir']}/sites-available/vhost" do
  source "vhost.erb"
  owner "root"
  group node['apache']['root_group']
  mode 00644
  notifies :restart, "service[apache2]"
end

apache_site "vhost" do
  enable true
end
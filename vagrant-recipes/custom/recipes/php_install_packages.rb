packages = ['php5-memcached', 'php5-memcache', 'php5-mysql', 'php5-xdebug', 'php-apc', 'php5-mcrypt', 'php5-gd', 'php5-curl']

packages.each do |pkg|
  package pkg do
    action :install
  end
end

execute "Configure xdebug" do
  command 'echo "xdebug.max_nesting_level=9999
xdebug.remote_connect_back=1
xdebug.remote_enable=1
xdebug.var_display_max_children=9999
xdebug.var_display_max_data=9999
xdebug.var_display_max_depth=9999" >> /etc/php5/conf.d/xdebug.ini'
  not_if "grep remote /etc/php5/conf.d/xdebug.ini"
end
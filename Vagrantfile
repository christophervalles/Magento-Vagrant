######################################################################
#                                                                    #
# Vagrant configuration file                                         #
#                                                                    #
######################################################################
# 
# 1.- Modify the file chef/custom/templates/default/vhost.erb to suit your needs and paths
# 2.- Modify the passwords for mysql below if needed, by default root has no password and has access from everywhere
# 
Vagrant.configure('2') do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ['setextradata', :id, 'VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root', 1]
    vb.customize ['modifyvm', :id, '--memory', 1024, '--cpus', 1]
    vb.name = 'magento'
  end
  config.vm.network :private_network, ip: '192.168.56.4'
  
  config.vm.box = 'ubuntu-12.04'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  
  config.ssh.max_tries = 50
  config.ssh.timeout = 300
  config.ssh.forward_agent = true
  config.ssh.shell = 'bash -l'
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'vagrant-recipes'
    
    chef.add_recipe('custom::set_timezone')
    chef.add_recipe('apt')
    chef.add_recipe('build-essential')
    chef.add_recipe('vim')
    chef.add_recipe('custom::mysql_listen_ip')
    chef.add_recipe('mysql::server')
    chef.add_recipe('custom::mysql_root_permissions')
    chef.add_recipe('memcached')
    chef.add_recipe('php')
    chef.add_recipe('custom::php_install_packages')
    chef.add_recipe('custom::php_custom_ini_file')
    chef.add_recipe('apache2')
    chef.add_recipe('apache2::mod_rewrite')
    chef.add_recipe('apache2::mod_php5')
    chef.add_recipe('custom::add_vhost')
    chef.add_recipe('custom::manage_www_user')
    chef.add_recipe('custom::restart_services')
    
    chef.log_level = :info
    
    chef.json = {
      :mysql => {
        :server_root_password => '',
        :server_repl_password => 'repl',
        :server_debian_password => 'debian'
      },
    }
  end
end
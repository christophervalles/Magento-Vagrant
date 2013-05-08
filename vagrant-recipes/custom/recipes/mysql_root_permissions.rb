execute "Give root access from any host" do
  command 'mysql -uroot mysql -e "GRANT ALL PRIVILEGES ON *.* TO \'root\'@\'%\' IDENTIFIED BY \'\';"'
end

execute "Flush mysql privileges" do
  command 'mysql -uroot mysql -e "FLUSH PRIVILEGES;"'
end
execute "Manage www-data user groups" do
  command "usermod -aG vagrant www-data"
end
execute "Set timezone" do
  command "echo 'Europe/London' | sudo tee /etc/timezone"
end

execute "Reconfigure tzdata" do
  command "sudo dpkg-reconfigure --frontend noninteractive tzdata"
end
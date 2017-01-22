#my vagrant file
# 2 indicates the version
Vagrant.configure("2")  do  |c|
#config.vm.box takes the short hand of the virtual box 
#which is to be downloaded from the hashicorp	
	#config.vm.box
	c.vm.box = "precise"
c.vm.define "myvm"
c.vm.define "myvm" do |myvm|
  myvm.vm.hostname = "nabuntu"
end
	# it is to change the host name, like "ubuntu@venesh:"
	c.vm.hostname = "venesh"
	 c.vm.box_url = "https://files.vagrantup.com/precise32.box"
#config.vm.boot_timeout is used to mention the time in seconds that
#vagrant will wait for the machine to boot and accessible.
    #config.vm.boot_timeout
	c.vm.network "private_network", ip:"192.168.33.10"
#this is to check_updates if it is set to true it will check or it won't
	#config.vm.box_check_update
#URL from where the box has to be downloaded, if box is to be 
#downloaded form hashicorp no need to use this parmeter
	#config.vm.box_url
c.vm.provider "virtualbox" do |v|
v.gui=true
v.memory ='1048'
end
c.vm.provision "shell",inline:<<-SHELL
sudo apt-get update
sudo apt-get install -y nginx
sudo mkdir sachin
SHELL
end 
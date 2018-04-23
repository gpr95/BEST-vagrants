Vagrant.configure("2") do |config|
  config.vm.define "victim" do |victim|
    victim.vm.box = "debian/jessie64"
    victim.vm.provider "virtualbox" do |v|
      # Recommended for debian x64
      v.memory = 1024
      v.cpus = 1
      v.customize ["modifyvm", :id, "--usb", "on", "--usbehci", "off"]
    end
    #Workaround to fix an OS X specific issue
    victim.vm.synced_folder '.', '/vagrant', :disabled => true
    victim.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
    victim.vm.network "public_network"
    #Provision all utilities
    victim.vm.provision :shell, path: "bootstrap.sh"
    victim.vm.provision :shell, path: "route.sh", run: "always"
  end

  config.vm.define "attacker" do |attacker|
    attacker.vm.box = "debian/jessie64"
    attacker.vm.provider "virtualbox" do |v|
      # Recommended for debian x64
      v.memory = 1024
      v.cpus = 1
      v.customize ["modifyvm", :id, "--usb", "on", "--usbehci", "off"]
    end
    #Workaround to fix an OS X specific issue
    attacker.vm.synced_folder '.', '/vagrant', :disabled => true
    attacker.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
    attacker.vm.network "public_network"
    #Provision all utilities
    attacker.vm.provision :shell, path: "bootstrap.sh"
    attacker.vm.provision :shell, path: "route.sh", run: "always"
  end
end

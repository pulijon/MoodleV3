# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

  config.vm.define "moodlev3" do |node|
    node.vm.box = "bento/debian-11"
  
    # JMR Para evitar cargar las guest additions
    if Vagrant.has_plugin?("vagrant-vbguest") then
      node.vbguest.auto_update = false
    end
  
    node.vm.hostname = "moodlev3"
    node.vm.network "private_network", ip: "192.168.56.100"
    
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 2
    end

    # Configuración local y carga de soporte puppet
    node.vm.provision "shell", inline: <<-SHELL
      localectl set-locale LANG=es_ES.UTF-8
      localectl set-keymap es
      timedatectl set-timezone Europe/Madrid
      apt update
      apt install -y puppet
      puppet module install puppetlabs-stdlib
      puppet module install puppetlabs-vcsrepo
    SHELL

    # Configuración por puppet
    node.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "moodlev3.pp"
    end
  end
  
end

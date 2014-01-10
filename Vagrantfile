# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 expandtab:

Vagrant.configure("2") do |config|

  box = "precise32"
  box_url = "http://files.vagrantup.com/precise32.box"

  # [mongo2] Secondary
  config.vm.define :mongo2 do |conf|
    conf.vm.box = box
    conf.vm.box_url = box_url
    conf.vm.hostname = "mongo2"
    conf.vm.network "private_network", ip: "192.168.64.21"
    conf.vm.provision :shell, path: "mongo-install.sh"
  end

  # [mongo3] Arbiter
  config.vm.define :mongo3 do |conf|
    conf.vm.box = box
    conf.vm.box_url = box_url
    conf.vm.hostname = "mongo3"
    conf.vm.network "private_network", ip: "192.168.64.31"
    conf.vm.provision :shell, path: "mongo-install.sh"
  end

  # [mongo1] Primary (setup last so that the others can be added to the primary replica set)
  config.vm.define :mongo1, primary: true do |conf|
    conf.vm.box = box
    conf.vm.box_url = box_url
    conf.vm.hostname = "mongo1"
    conf.vm.network "private_network", ip: "192.168.64.11"
    conf.vm.provision :shell, path: "mongo-install.sh"
    conf.vm.provision :shell, path: "mongo-init-repl-on-primary.sh"
  end

end

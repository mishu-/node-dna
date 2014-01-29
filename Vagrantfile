# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = ENV['VAGRANT_BOX'] or "base"
  config.vm.network :forwarded_port, guest: 35729, host: 35729 #livereload port
  config.vm.network :forwarded_port, guest: 5445, host: 5445 #nodejs port
  config.vm.provision :shell, :path => "config/scripts/vagrant-bootstrap.sh"

end

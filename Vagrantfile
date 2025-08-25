# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

   # forward port từ guest (VM) ra host (Windows)
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  config.vm.synced_folder "./src", "/var/www/project" # , owner: "vagrant", group: "vagrant", type: "virtualbox"
  # config.vm.synced_folder "./src", "/var/www/project", owner: "vagrant", group: "vagrant", type: "rsync"
  # Tăng thời gian timeout (mặc định 300 giây).
  # Thêm option để tránh lỗi boot chậm trên máy yếu hoặc mạng chậm.
  config.vm.boot_timeout = 900
  # Tắt auto update Guest Additions khi boot
  config.vbguest.auto_update = false
  # Không cho vbguest tải ISO từ Internet
  config.vbguest.no_remote = true
  
  config.vm.provision "shell", inline: <<-SHELL
    mkdir -p /var/www/project
  SHELL

  # Chạy kịch bản cấu hình bootstrap.sh để tự động cài đăt Apache
  config.vm.provision "shell", path: "scripts/bootstrap.sh"

  # Run install-node.sh to set up Node.js
  config.vm.provision "shell", path: "scripts/install-node.sh"

  
  config.vm.provision "shell", path: "scripts/install-docker.sh"
end

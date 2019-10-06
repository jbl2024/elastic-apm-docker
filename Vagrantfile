Vagrant.configure("2") do |config|
  config.vm.box = "bento/debian-10"
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', 8192]
    vb.customize ['modifyvm', :id, '--cpus', 2]
  end
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.vm.network "forwarded_port", guest: 5601, host: 5601
  config.vm.network "forwarded_port", guest: 8200, host: 8200
  config.vm.provision "shell", path: "scripts/install-deps.sh", privileged: true
  config.vm.synced_folder '.', '/vagrant', owner: 'vagrant', group: 'root'
end

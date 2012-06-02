namespace :puppet do

  desc 'install puppet via gems'
  task :gem_puppet_install do
    %x(gem install --remote puppet facter --no-ri --no-rdoc)
  end

  desc 'install devel release of puppet'
  task :devel_puppet_install do 
    Rake::Task['repos:puppet_devel'].invoke
    %x(yum makecache)
    %x(yum install -y puppet facter)
  end

  desc 'install production puppet'
  task :prod_install_puppet do 
    Rake::Task['repos:puppet_prod'].invoke
    %x(yum makecache)
    %x(yum install -y puppet facter)
  end

  desc 'add puppet users and groups'
  task :puppet_accounts do
    %x(groupadd -g 53 puppet && useradd -u 53 -g 53 -m -d /var/lib/puppet puppet)
  end

  desc 'configure puppet for vagrant'
  task :configure_puppet_vagrant do
    File.symlink('/etc/puppet', '/shared/puppet')
  end

  desc 'install all puppet requirements'
  task :run => [:prod_install_puppet]

end

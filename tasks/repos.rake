namespace :repos do

  desc 'add puppet labs prod repo and dependencies'
  task :puppet_prod do 
    %x(rpm -ivh http://yum.puppetlabs.com/el/6Server/products/x86_64/puppetlabs-release-6-1.noarch.rpm)
  end

  desc 'add puppet labs devel repo'
  task :puppet_devel do 
    %x(rpm -ivh http://yum.puppetlabs.com/el/6Server/devel/x86_64/puppetlabs-release-devel-6-1.noarch.rpm)
  end
 
end 

unless ENV['windir']
  require 'rubygems'
  require 'vagrant'
else
#  path = ['C:/vagrant/vagrant/embedded/lib/ruby/gems/1.9.1/gems/','C:/vagrant/vagrant/embedded/lib/ruby/site_ruby']
#  path.each do |p|
#    $:.unshift p
#  end
#  puts "ruby path -> #{$:}"
#  load 'C:/vagrant/vagrant/embedded/lib/ruby/gems/1.9.1/gems/vagrant-1.0.3/lib/vagrant.rb'
#  load 'C:/vagrant/vagrant/embedded/lib/ruby/gems/1.9.1/gems/log4r-1.1.10/lib/log4r.rb'
  require 'rubygems'
  require 'vagrant'
end

namespace :jenkins_build do

  desc 'Build the run the vagrant jobs to lauch instances'
  task :up do
    Dir.chdir('../') do
      puts "about to launch the nodes specified in the vagrant file"
      env = Vagrant::Environment.new
      env.cli("up")
      puts "complete setup"
    end
  end

  desc 'Destroys the vagrant nodes'
  task :destroy do
    Dir.chdir('../') do
      puts "about to destroy vagrant instances"
      env = Vagrant::Environment.new
      env.cli("destroy")
      puts "instances destroyed"
    end
  end

end

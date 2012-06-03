
namespace :project_setup do
  desc 'setup up common project directories'
  task :create_dirs, :project do |t, args|
    Dir.chdir("../projects") do
      puts "creating this is project: #{args[:project]}"
      Dir.mkdir("#{args[:project]}") unless File.directory?("#{args[:project]}")
      Dir.mkdir("#{args[:project]}/shared_folder") unless File.directory?("#{args[:project]}/shared_folder")
      Dir.mkdir("#{args[:project]}/.ssh") unless File.directory?("#{args[:project]}/.ssh")
    end
  end

  desc 'clones the vagarnt setup repo to the local project dir'
  task :clone_setup, :project do |t, args|
    Rake::Task['project_setup:create_dirs'].invoke(args[:project])
    Dir.chdir("../projects/#{args[:project]}") do
      Rake::Task['git:git_checkout'].invoke('vagrant_setup')
      %x(cp vagrant_setup/keys/* .ssh/)
    end
  end

  desc 'puppet master checkout'
  task :puppet_checkout, :project  do |t, args|
    Dir.chdir("../projects/#{args[:project]}/shared_folder") do
      Rake::Task['git:git_checkout'].invoke('puppet_master')
      Rake::Task['git:git_init_submod'].invoke
      Rake::Task['git:git_update_submod'].invoke
    end
  end
end

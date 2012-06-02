
namespace :project_setup do
  desc 'setup up common project directories'
  task :create_dirs, :project do |t, args|
    Dir.chdir("../projects") do
      puts "this is project: #{args[:project]}"
      Dir.mkdir("#{args[:project]}") unless File.directory?("#{args[:project]}")
      Dir.mkdir("#{args[:project]}/shared_folder") unless File.directory?("#{args[:project]}/shared_folder")
      Dir.mkdir("#{args[:project]}/.ssh") unless File.directory?("#{args[:project]}/.ssh")
    end
  end

  desc 'clone setup'
  task :clone_setup, :project do |t, args|
    Rake::Task['project_setup:create_dirs'].invoke(args[:project])
    Dir.chdir("../projects/#{args[:project]}") do
      puts Dir.pwd
      Rake::Task['git:git_checkout'].invoke('vagrant_setup')
    end
  end
end

namespace :git do
  desc 'check out revision from github'
  task :git_checkout, :git_repo do |t, args|
    system("git clone https://github.com/denmat/#{args[:git_repo]}.git")
  end

end
   


namespace :project_setup do
  desc 'setup up common project directories'
  task :create_dirs, :project do
    Dir.mkdir("projects/#{project}") unless Dir.exits("projects/#{project}")
    Dir.mkdir("projects/#{project}/shared_folder") unless Dir.exits("projects/#{project}/shared_folder")
    Dir.mkdir("projects/#{project}/.ssh") unless Dir.exits("projects/#{project}/.ssh")
  end

  desc 'clone setup'
  task :clone_setup, :project do
    Rake::Task["project:setup[#{project}]"].invoke
    Rake::Task["git:git_checkout['vagrant_setup']"].invoke
  end
end

namespace :git do
  desc 'check out revision from github'
  task :git_checkout, :git_reop do
    Dir.mkdir('projects/shared_folder') unless Dir.exits?('projects/shared_folder')
    system('git clone https://github.com/denmat/#{git_repo}.git projects/#{git_repo}')
  end

end
   


namespace :git do
  desc 'check out revision from github'
  task :git_checkout, :git_repo do |t, args|
    system("git clone https://github.com/denmat/#{args[:git_repo]}.git")
  end

  desc 'pull revision from github'
  task :git_pull do  
    system("git pull")
  end

  desc 'git add bmodule'
  task :git_add_submod, :git_repo, :path do |t, args|
    system("git add submodule #{args[:git_repo]} #{args[:path]}")
  end

  desc 'git init submodule'
  task :git_init_submod  do
    system("git submodule init")
  end
  
  desc 'git update submodule'
  task :git_update_submod do
    system("git submodule update")
  end
  
end
   

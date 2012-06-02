namespace :hadoop do

  desc 'create data directory'
  task :create_data do
    Dir.mkdir('/data')
  end

  desc 'format the /data dir'
  task :format_sdb do
    %x(mkfs.ext4 -m 0 -F -L DATA /dev/sdb)
  end

  desc 'add to fstab'
  task :update_fstab do
    %x(printf 'LABEL=DATA /data  ext4  noatime,nobarrier,defaults 1 2\n' >> /etc/fstab)
  end

  desc 'runs creates, formats and mounts /dev/sdb' 
  task :run => [:create_data, :format_sdb, :update_fstab]

end

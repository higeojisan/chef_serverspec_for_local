# Swap領域の作成※AMI作成時用(Vagrantの場合は不要)
script 'make swap' do
  swap_file = node['initial_settings']['swap']['file']
  user 'root'
  interpreter 'bash'
  code <<-EOH
    dd if=/dev/zero of=#{swap_file} bs=#{node['initial_settings']['swap']['block_size']} count=#{node['initial_settings']['swap']['count']}
    chmod 600 #{swap_file}
    mkswap #{swap_file}
    swapon #{swap_file}
  EOH
  not_if { File.exists?(swap_file) }
end

 # Swap領域の永続化※AMI作成時用(Vagrantの場合は不要)
execute 'modify fstab for Swap' do
  swap_file = node['initial_settings']['swap']['file']
  user 'root'
  command "echo '#{swap_file} swap swap defaults 0 0' >> /etc/fstab"
  not_if "grep '#{swap_file} swap swap defaults 0 0' /etc/fstab"
end

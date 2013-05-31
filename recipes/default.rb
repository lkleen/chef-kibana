package 'git'

kibana_group = node['kibana']['group']
kibana_user  = node['kibana']['user']
kibana_directories = node['kibana']['dir']

group kibana_group do
end

user kibana_user do
  comment 'Kibana Server'
  gid node['kibana']['group']
  home node['kibana']['dir']['root']
  shell '/bin/bash'
  system true
end

kibana_directories.values.each do |dir|
  directory dir do
    mode 00700
    owner kibana_user
    group kibana_group
    recursive true
  end
end

git kibana_directories['root'] do
  repository node['kibana']['git']['url']
  reference node['kibana']['git']['reference']
  user kibana_user
  group kibana_group
  action :checkout
end

gem_package 'bundler' do
  action :install
end

# kibana requires eventmachine which requires a gem with native extensions. Thus we need
# to include build-essentials prior to installing kibana
include_recipe 'build-essential::default'

bash 'kibana bundle install' do
  cwd kibana_directories['root']
  code 'bundle install'
end

service 'kibana' do
  supports :start => true, :restart => true, :stop => true, :status => true
  action :nothing
end

template '/etc/init.d/kibana' do
  source 'kibana.init.erb'
  mode 00755
  notifies :restart, 'service[kibana]', :delayed
end

template "#{kibana_directories['root']}/KibanaConfig.rb" do
  source 'KibanaConfig.rb.erb'
  user kibana_user
  group kibana_group
  mode 00600
  notifies :restart, 'service[kibana]', :delayed
end

service 'kibana' do
  action [:enable, :start]
end

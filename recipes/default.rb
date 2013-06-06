# kibana requires eventmachine which requires a gem with native extensions. Thus we need
# to include build-essentials prior to installing kibana
include_recipe 'build-essential::default'

package 'git'

kibana_group     = node['kibana']['group']
kibana_user      = node['kibana']['user']
kibana_path_base = node['kibana']['path']['base']

# currently only the root user is supported
# bundler fucks up my attempts to change it

user kibana_user do
  comment 'Kibana Server'
  home kibana_path_base
  shell '/bin/bash'
end

groups = [
    kibana_group,
    'rvm',
    'root'
]

groups.each do |group|
  group group do
    members [kibana_user]
    append true
  end
end

directory "/root" do
  mode 00770
  recursive true
end

directory kibana_path_base do
  mode 00700
  owner kibana_user
  group kibana_group
  recursive true
end

git kibana_path_base do
  repository node['kibana']['git']['url']
  reference node['kibana']['git']['reference']
  user kibana_user
  group kibana_group
  action :checkout
end

template '/etc/init.d/kibana' do
  source 'kibana.init.erb'
  mode 00755
  notifies :restart, 'service[kibana]', :delayed
end

kibana_bundle kibana_path_base do
  user kibana_user
  group kibana_group
  action :install
end

template "#{kibana_path_base}/KibanaConfig.rb" do
  source 'KibanaConfig.rb.erb'
  user kibana_user
  group kibana_group
  mode 00600
  notifies :restart, 'service[kibana]', :delayed
end



service 'kibana' do
  supports :start => true, :restart => true, :stop => true, :status => true
  action :nothing
end
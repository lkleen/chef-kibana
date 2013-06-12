# kibana requires eventmachine which requires a gem with native extensions. Thus we need
# to include build-essentials prior to installing kibana
include_recipe 'build-essential::default'

package 'git'

kibana_group     = node['kibana']['group']
kibana_user      = node['kibana']['user']
kibana_path_base = node['kibana']['path']['base']
kibana_path_logs = node['kibana']['path']['logs']

groups = [
    kibana_group,
    'rvm',
    'root'
]

user kibana_user do
  home kibana_path_base
  action :create
end

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

kibana_git kibana_path_base do
  user kibana_user
  group kibana_group
  log_dir kibana_path_logs
  repository node['kibana']['git']['url']
  reference node['kibana']['git']['reference']
  action :checkout
end

kibana_bundle kibana_path_base do
  user 'root'
  group 'root'
  action :install
end

service 'kibana' do
  supports :start => true, :stop => true, :restart => true, :status => true
  action :restart
end
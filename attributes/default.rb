default['kibana']['dir']['root'] = '/opt/kibana'
default['kibana']['dir']['tmp']  = "#{node['kibana']['dir']['root']}/tmp"

default['kibana']['user'] = 'kibana'
default['kibana']['group'] = 'kibana'
default['kibana']['git']['url'] = 'https://github.com/rashidkpc/Kibana.git'
default['kibana']['git']['reference'] = 'v0.2.0'
default['kibana']['interface'] = '0.0.0.0'
default['kibana']['port'] = 5601
default['kibana']['elasticsearch']['host'] = '127.0.0.1'
default['kibana']['elasticsearch']['port'] = 9200
default['kibana']['rubyversion'] = '1.9.2'

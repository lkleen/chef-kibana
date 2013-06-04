default['kibana']['path']['base'] = '/opt/kibana'
default['kibana']['user'] = 'kibana'
default['kibana']['group'] = 'kibana'
default['kibana']['git']['url'] = 'git@github.com:lkleen/Kibana.git'
default['kibana']['git']['reference'] = 'v0.2.1'
default['kibana']['interface'] = '0.0.0.0'
default['kibana']['port'] = 5601
default['kibana']['elasticsearch']['host'] = '127.0.0.1'
default['kibana']['elasticsearch']['port'] = 9200
default['kibana']['rubyversion'] = '1.9.2'

set['authorization']['sudo']['groups'] = [node['kibana']['group']]
set['authorization']['sudo']['users'] = [node['kibana']['user']]
set['authorization']['sudo']['passwordless'] = true
set['authorization']['sudo']['include_sudoers_d'] = true


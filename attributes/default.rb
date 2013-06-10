# currently only the root user is supported
# since ruby don't want me to change it easily
default['kibana']['user'] = 'root'
default['kibana']['group'] = 'root'

default['kibana']['path']['base'] = '/opt/kibana'
default['kibana']['git']['url'] = 'https://github.com/lkleen/Kibana.git'
default['kibana']['git']['reference'] = 'lkleen-20130604'
default['kibana']['interface'] = '0.0.0.0'
default['kibana']['port'] = 5601
default['kibana']['elasticsearch']['host'] = '127.0.0.1'
default['kibana']['elasticsearch']['port'] = 9200
default['kibana']['rubyversion'] = '1.9.3'



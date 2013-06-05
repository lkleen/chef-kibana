# until I can fix the bundler installation kibana will not work
# if it is not running as root
default['kibana']['user'] = 'root'
default['kibana']['group'] = 'root'

default['kibana']['path']['base'] = '/opt/kibana'
default['kibana']['git']['url'] = 'https://github.com/lkleen/Kibana.git'
default['kibana']['git']['reference'] = 'v0.2.1'
default['kibana']['interface'] = '0.0.0.0'
default['kibana']['port'] = 5601
default['kibana']['elasticsearch']['host'] = '127.0.0.1'
default['kibana']['elasticsearch']['port'] = 9200
default['kibana']['rubyversion'] = '1.9.2'



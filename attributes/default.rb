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

set['rvm']['ruby']['version'] = node['kibana']['rubyversion']
set['rvm']['global_gems'] = [
        {
            'name'    => 'bundler',
            'version' => '1.1.5'
        },
        {
            'name'    => 'rake',
            'version' => '10.0.4'
        },
        {
            'name'    => 'rubygems-bundler',
            'action'  => 'remove'
        },
        {
            'name'    => 'daemons',
            'version' => '1.1.9'
        },
        {
            'name'    => 'diff-lcs',
            'version' => '1.1.3'
        },
        {
            'name'    => 'eventmachine',
            'version' => '1.0.0'
        },
        {
            'name'    => 'fastercsv',
            'version' => '1.5.5'
        },
        {
            'name'    => 'json',
            'version' => '1.7.5'
        },
        {
            'name'    => 'rack',
            'version' => '1.4.1'
        },
        {
            'name'    => 'rack-protection',
            'version' => '1.2.0'
        },
        {
            'name'    => 'tilt',
            'version' => '1.3.3'
        },
        {
            'name'    => 'sinatra',
            'version' => '1.3.3'
        },
        {
            'name'    => 'thin',
            'version' => '1.5.0'
        },
        {
            'name'    => 'tzinfo',
            'version' => '0.3.35'
        },
        {
            'name'    => 'rspec-core',
            'version' => '2.11.1'
        },
        {
            'name'    => 'rspec-expectations',
            'version' => '2.11.3'
        },
        {
            'name'    => 'rspec-mocks',
            'version' => '2.11.3'
        },
        {
            'name'    => 'rspec',
            'version' => '2.11.0'
        }
    ]



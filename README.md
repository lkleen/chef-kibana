Description
===========

A cookbook that installs [Kibana](https://github.com/rashidkpc/Kibana).

Platforms
=========
- `ubuntu`

Requirements
============

Kibana requires ElasticSearch index to be configured to work as per logstash requirements.

Attributes
==========

* `node['kibana']['base_dir']` - The base directory of kibana. Defaults to '/opt/kibana'.
* `node['kibana']['user']` - The user under which Kibana is installed. Defaults to 'kibana'.
* `node['kibana']['group']` - The group under which Kibana is installed. Defaults to 'kibana'.
* `node['kibana']['git']['url']` - The URL to Kibana repository. Defaults to 'git://github.com/rashidkpc/Kibana.git'.
* `node['kibana']['git']['reference']` - The git reference in the Kibana repository. Defaults to 'v0.2.0'.
* `node['kibana']['interface']` - The interface on which to bind. Defaults to node['ipaddress'].
* `node['kibana']['port']` - The port on which to bind. Defaults to 5601.
* `node['kibana']['elasticsearch']['host']` - The host of the elasticsearch service. Defaults to '127.0.0.1'.
* `node['kibana']['elasticsearch']['port']` - The port of the elasticsearch http service. Defaults to 9200.
* `node['kibana']['rubyversion']` - The version of Ruby and Gems to use for Kibana.Defaults to `1.9.1`


Recipes
=======

* `default` - Install Kibana.


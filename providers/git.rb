# wraps git to add tmp which is required to
# call 'ruby kibana-daemon.rb restart' initially
action :checkout do

  dir = new_resource.dir
  user = new_resource.user
  group = new_resource.group

  git dir do
    repository new_resource.repository
    reference new_resource.reference
    user user
    group group
    action :checkout
  end

  directory "#{dir}/tmp" do
    user user
    group group
    mode 00766
    action :create
  end

  template '/etc/init.d/kibana' do
    source 'kibana.init.erb'
    user user
    group group
    mode 00755
    notifies :restart, 'service[kibana]', :delayed
  end

  template "#{dir}/KibanaConfig.rb" do
    source 'KibanaConfig.rb.erb'
    user user
    group group
    mode 00600
    notifies :restart, 'service[kibana]', :delayed
  end

end
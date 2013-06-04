action :install do

  path = new_resource.name
  group = new_resource.group
  user = new_resource.user

  Chef::Log.debug "group #{group}"
  Chef::Log.debug "path #{path}"
  Chef::Log.debug "user #{user}"

  cmd = Mixlib::ShellOut.new(
      'bundle install --verbose',
      :cwd => path,
      :group => group,
      :user => user
  )
  cmd.run_command

  Chef::Log.debug "STATUS #{cmd.error!}"
  Chef::Log.debug "BUNDLER OUTPUT: #{cmd.stdout}"

  #raise RuntimeError, "The repository file to create is nil, cannot continue." if @repo_file.nil?
end
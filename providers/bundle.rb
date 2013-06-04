action :install do

  cwd   = new_resource.name
  group = new_resource.group
  user  = new_resource.user

  command = "bundle install --verbose --deployment"

  Chef::Log.debug "group #{group}"
  Chef::Log.debug "cwd #{cwd}"
  Chef::Log.debug "user #{user}"

  cmd = Mixlib::ShellOut.new(
      command,
      :cwd => cwd,
      :group => group,
      :user => user,
      :live_stream => STDOUT
  )
  cmd.run_command
  cmd.error!

end
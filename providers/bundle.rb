action :install do

  cwd = new_resource.name
  group = new_resource.group
  user = new_resource.user

  commands = [
      "/usr/local/rvm/bin/rvm reset"
  ]

  commands.each do |command|
    shellExec(command, cwd, user, group)
  end

end

def shellExec(command, cwd, user, group)
  Chef::Log.debug "executing command #{command}"

  cmd = Mixlib::ShellOut.new(
      command,
      :cwd => cwd,
      :group => group,
      :user => user,
      :live_stream => STDOUT
  )
  cmd.run_command
  cmd.error!

  Chef::Log.debug "exitstatus: #{cmd.exitstatus}"
  Chef::Log.debug "environment: #{cmd.environment}"
  Chef::Log.debug "status: #{cmd.status}"
  Chef::Log.debug "stderr: #{cmd.stderr}"

end
action :install do

  cwd = new_resource.name
  group = new_resource.group
  user = new_resource.user

  Chef::Log.debug "group #{group}"
  Chef::Log.debug "cwd #{cwd}"
  Chef::Log.debug "user #{user}"

  ENV['GEM_HOME'] = "/usr/local/rvm/gems/ruby-1.9.3-p429"
  ENV['GEM_PATH'] = "/usr/local/rvm/gems/ruby-1.9.3-p429:/usr/local/rvm/gems/ruby-1.9.3-p429@global;"

  shellExec('gem install bundler', cwd, 'root', 'root')

  commands = [
      "echo \"installing bundles to $GEM_HOME\"",
      "bundle install"
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
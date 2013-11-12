APP_ROOT = '/var/www/mapidy/current'
ENV['BUNDLE_GEMFILE'] = APP_ROOT + '/Gemfile'

require 'bundler/setup'

worker_processes 2
working_directory APP_ROOT

listen "#{APP_ROOT}/tmp/sockets/unicorn.sock", backlog: 64
timeout 90
pid "#{APP_ROOT}/tmp/pids/unicorn.pid"

stderr_path "#{APP_ROOT}/log/unicorn.stderr.log"
stdout_path "#{APP_ROOT}/log/unicorn.stdout.log"


preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
    GC.copy_on_write_friendly = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end

  sleep 1
end

after_fork do |server, worker|

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection

end

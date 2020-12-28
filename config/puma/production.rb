# config/puma/production.rb
environment "production"

# UNIX Socketへのバインド
tmp_path = "#{File.expand_path("../../..", __FILE__)}/tmp"
bind "unix://#{tmp_path}/sockets/puma.sock"

# スレッド数とWorker数の指定
threads 3, 3
workers 2
preload_app!

# デーモン化の設定
# daemonize
pidfile "#{tmp_path}/pids/puma.pid"
# stdout_redirect "#{tmp_path}/logs/puma.stdout.log", "#{tmp_path}/logs/puma.stderr.log", true

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

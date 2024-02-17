namespace :unicorn do
  task :environment do
    set :unicorn_pid,    "#{current_path}/tmp/pids/unicorn.pid"
    set :unicorn_config, "#{current_path}/config/unicorn/production.rb"
  end

  def start_unicorn
    on roles(:app) do
      execute :bundle, :exec, :unicorn, "-c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
    end
  end

  def stop_unicorn
    on roles(:app) do
      execute :kill, "-s QUIT $(cat #{fetch(:unicorn_pid)})"
    end
  end

  def reload_unicorn
    on roles(:app) do
      execute :kill, "-s USR2 $(cat #{fetch(:unicorn_pid)})"
    end
  end

  def force_stop_unicorn
    on roles(:app) do
      execute :kill, "$(cat #{fetch(:unicorn_pid)})"
    end
  end

  desc "Start unicorn server"
  task start: :environment do
    start_unicorn
  end

  desc "Stop unicorn server gracefully"
  task stop: :environment do
    stop_unicorn
  end

  desc "Restart unicorn server gracefully"
  task restart: :environment do
    on roles(:app) do
      if test("[ -f #{fetch(:unicorn_pid)} ]")
        reload_unicorn
      else
        start_unicorn
      end
    end
  end

  desc "Stop unicorn server immediately"
  task force_stop: :environment do
    force_stop_unicorn
  end
end

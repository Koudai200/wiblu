namespace :unicorn do
  task :environment do
    on roles(:app) do
      within release_path do
        fetch(:unicorn_pid)    { File.join(release_path, 'tmp', 'pids', 'unicorn.pid') }
        fetch(:unicorn_config) { File.join(release_path, 'config', 'unicorn', 'production.rb') }
      end
    end
  end

  desc "Start unicorn server"
  task start: :environment do
    on roles(:app) do
      within release_path do
        execute :bundle, :exec, :unicorn, "-c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
      end
    end
  end

  desc "Stop unicorn server gracefully"
  task stop: :environment do
    on roles(:app) do
      within release_path do
        if test("[ -f #{fetch(:unicorn_pid)} ]")
          execute :kill, "-s QUIT $(cat #{fetch(:unicorn_pid)})"
        end
      end
    end
  end

  desc "Restart unicorn server gracefully"
  task restart: :environment do
    on roles(:app) do
      invoke "unicorn:stop"
      invoke "unicorn:start"
    end
  end

  desc "Stop unicorn server immediately"
  task force_stop: :environment do
    on roles(:app) do
      within release_path do
        execute :kill, "$(cat #{fetch(:unicorn_pid)})"
      end
    end
  end
end

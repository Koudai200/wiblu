# config valid for current version and patch releases of Capistrano
lock "~> 3.18.0"

set :application, "Libeu_app"
set :repo_url, "git@github.com:Koudai200/wiblu.git"
set :branch, 'main'

set :deploy_to, '/var/www/Libeu_app'
set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :keep_releases, 5

# rbenvの設定
set :rbenv_type, :user
set :rbenv_ruby, '3.2.3'

# デプロイのタスク
namespace :deploy do

  # unicornの再起動
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  # データベースの作成
  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          # データベース作成のsqlセット
          # データベース名はdatabase.ymlに設定した名前で
          sql = "CREATE DATABASE IF NOT EXISTS libeu_app_production;"
          # クエリの実行。
          # userとpasswordはmysqlの設定に合わせて
          execute "mysql --user=root --password='Kou4657422w2YbCH2-' -e '#{sql}'"
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end

end

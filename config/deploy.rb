set :application, 'app'
set :repo_url, 'https://github.com/silasb/deepstackdata-app.git'
set :rbenv_ruby_version, '2.0.0-p247'
set :rbenv_ruby, '2.0.0-p247'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/srv/www/api/app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

after "deploy:published", "preconfigure"
desc "Configure the application with correct database and precompile assets"
task :preconfigure do
  # symlink database file and backup current one
  run "ln -sf #{shared_path}/production.sqlite3 #{release_path}/db/production.sqlite3"
  run "touch #{release_path}/db/production.sqlite3" # make sure at least empty file exists so it can be copied
  run "cp #{release_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3.backup"
end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end

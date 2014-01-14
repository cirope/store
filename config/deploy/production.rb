set :stage, :production
set :rails_env, 'production'

role :web, %w{deployer@store.com}
role :app, %w{deployer@store.com}
role :db,  %w{deployer@store.com}

server 'store.com', user: 'deployer', roles: %w{web app db}

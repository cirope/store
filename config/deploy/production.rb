set :stage, :production
set :rails_env, 'production'

role :web, %w{deployer@login.cirope.com}
role :app, %w{deployer@login.cirope.com}
role :db,  %w{deployer@login.cirope.com}

server 'login.cirope.com', user: 'deployer', roles: %w{web app db}

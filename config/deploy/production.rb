set :stage, :production
set :rails_env, 'production'

role :all, %w{store.com}

server 'store.com', user: 'deployer', roles: %w{web app db}

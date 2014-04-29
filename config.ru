require 'dashing'
require 'pathname'
require 'dotenv'
Dotenv.load

configure do
  set :config, YAML::load_file(Pathname.new("config.yml").realpath.to_s)
  set :auth_token, ENV['auth_token']

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application

module RequestLumberjack
  class App < Sinatra::Base
    set :root,   File.dirname(__FILE__)
    set :static, true
    set :logging, true

    post '/?' do
      status 201

      LoggedResponse.create_from_response_params(params)
    end
  end
end

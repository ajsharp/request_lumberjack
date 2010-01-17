module RequestLumberjack
  class App < Sinatra::Base
    set :root,   File.dirname(__FILE__)
    set :static, true
    set :views, './views'
    set :logging, true

    get '/?' do
      headers "Content-Type" => "text/html; charset=utf8"
      @logs = LoggedResponse.all
      haml :index
    end

    post '/?' do
      status 201

      LoggedResponse.create_from_response_params(params)
    end
  end
end

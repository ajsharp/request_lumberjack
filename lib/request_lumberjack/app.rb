module RequestLumberjack
  class App < Sinatra::Base
    set :root,   File.dirname(__FILE__)
    set :logging, true
    set :views, './views'

    get '/?' do
      headers "Content-Type" => "text/html; charset=utf8"
      @logs = LoggedResponse.find_todays_responses
      haml :index
    end

    post '/?' do
      LoggedResponse.new(params).save ? halt(201) : halt(422)
    end
  end
end

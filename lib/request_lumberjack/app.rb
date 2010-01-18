module RequestLumberjack
  class App < Sinatra::Base
    set :root,   File.dirname(__FILE__)
    set :logging, true

    post '/?' do
      LoggedResponse.new(params).save ? halt(201) : halt(422)
    end
  end
end

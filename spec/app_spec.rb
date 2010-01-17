require 'spec_helper'
#require 'action_controller'


module RequestLumberjack
  describe App do
    it "act like a rack app" do
      env = lambda { |env| [200, {}, "body"] }
      @app = App.new(env)
    end
  end

  describe App, "POST /?" do
    it "should post correctly" do
      post '/'
      response.status.should == 201
    end

    it "should attempt to save a response" do
      LoggedResponse.should_receive(:create_from_response_params)
      post '/'
    end
  end
  
  describe App, "GET /?" do
    it "should be successful" do
      get '/'
      response.status.should == 200
    end
    
    it "should display a collection of logged responses" do
      LoggedResponse.should_receive(:all)
      get '/'
    end
  end
end


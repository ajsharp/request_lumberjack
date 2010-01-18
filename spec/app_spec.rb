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
      post '/', valid_params
      response.status.should == 201
    end

    it "should response with 422 if not passed any params" do
      post '/'
      response.status.should == 422
    end

    it "should response with 422 if not passed valid params" do
      lambda { 
        post '/', { 'invalid' => 'params' } 
      }.should raise_error(ArgumentError)
    end

    it "should attempt to save a response" do
      @logged_response = mock("LoggedResponse", :save => true)
      LoggedResponse.should_receive(:new).and_return(@logged_response)
      post '/', {  }
    end
  end
  
end


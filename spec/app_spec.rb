require 'spec_helper'
require 'action_controller'

module RequestLumberjack

  describe App do
    it "should accept a configuration file path" do
      env = lambda { |env| [200, {}, "body"] }
      @app = App.new(env)
    end
  end

  describe App, "when being invoked from rails" do
    before :all do
      RAILS_ENV='development' unless defined?(RAILS_ENV)
    end

    before :each do
      @response = get_rails_response
      @env = lambda { |env| [200, @response.headers, @response] }
      @app = App.new(@env)
    end

    it "should attempt to save a new response" do
      LoggedResponse.should_receive(:create_from_response)
      @app.call(@env)
    end

    it "should attempt to save a new rails response" do
      LoggedResponse.should_receive(:create_from_rails_response)
      @app.call(@response)
    end

    it "should return a successfull response" do
      @app.call(@response)[0].should == 200
    end
  end

end

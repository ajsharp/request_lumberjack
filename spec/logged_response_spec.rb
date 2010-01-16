require 'spec_helper'
require 'action_controller'

module RequestLumberjack
  describe LoggedResponse do
    before :each do
      @logger = LoggedResponse.new
    end

    it "should have an id" do
      @logger.should respond_to :id
    end

    it "should have a request_uri string field" do
      @logger.should respond_to :request_uri
    end

    it "should have a status integer field" do
      @logger.should respond_to :status
    end

    it "should have a user_id integer field" do
      @logger.should respond_to :user_id
    end

    it "should have a request method field" do
      @logger.should respond_to :request_method
    end

    it "should require a request_uri" do
      @logger.should_not be_valid
      @logger.errors.on(:request_uri).should_not be_blank
    end

    it "should require a status" do
      @logger.should_not be_valid
      @logger.errors.on(:status).should_not be_blank
    end

    it "should require the request method" do
      @logger.should_not be_valid
      @logger.errors.on(:request_method).should_not be_blank
    end
  end

  describe LoggedResponse, ".create_from_response" do
    it "should recognize a rails response" do
      class Rails; end
      LoggedResponse.should_receive(:create_from_rails_response)
      LoggedResponse.create_from_response("RESPONSE")
    end
  end

  describe LoggedResponse, ".create_from_rails_response" do
    def setup_response
      env = { 'REQUEST_METHOD' => 'GET', 'REQUEST_URI' => 'http://example.com/controller/action' }
      @request  = ActionController::Request.new env
      @response = ActionController::Response.new
      @response.request = @request
    end

    before :each do
      setup_response
      @logged_response = LoggedResponse.create_from_rails_response @response
    end

    it "should save a new response" do
      @logged_response.should_not be_new
    end

    it "should save the response code" do
      @logged_response.status.should == 200
    end

    it "should save the request method" do
      @logged_response.request_method.should == "get"
    end

    it "should save the request uri" do
      @logged_response.request_uri.should == "/controller/action"
    end
  end

end

require 'spec_helper'

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

  describe LoggedResponse, ".create_from_response_params" do
    before(:each) do
      @params = { 'status' => 200, 'request_uri' => '/', 'request_method' => 'get', 'bad' => 'dont save' }
    end
    
    it "should raise an error if params is not a hash" do
      lambda {
        LoggedResponse.create_from_response_params([])
      }.should raise_error(LoggedResponse::InvalidArgumentError)
    end
    
    it "should save the response paramaters" do
      LoggedResponse.create_from_response_params(@params).should == true
    end
    
    it "should return false on an unsuccessful save" do
      LoggedResponse.create_from_response_params({}).should == false
    end
    
    it "should only attempt to save accepted params" do
      lambda {
        LoggedResponse.create_from_response_params(@params) 
      }.should_not raise_error(ArgumentError)
    end
  end

end

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

    it "should have a request method field" do
      @logger.should respond_to :request_method
    end
    
    it "should have an extra fields field" do
      @logger.should respond_to :extra_fields
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

    it "should have an auto created_at field" do
      @logger.attributes = valid_params
      @logger.save
      @logger.created_at.should be_instance_of DateTime
    end

  end

  describe LoggedResponse, '#extra_fields' do
    before :each do
      @logged_response = LoggedResponse.new valid_params
      @logged_response.should be_valid
    end

    it "should save a ruby hash as json text" do
      @logged_response.extra_fields = {'user_id' => '1'}
      @logged_response.save
      @logged_response.extra_fields['user_id'].should == '1'
    end

    it "should save nested hash data" do
      @logged_response.extra_fields = { 'user' => { 'email' => 'user@example.com' } }
      @logged_response.save
      @logged_response.extra_fields['user']['email'].should == 'user@example.com'
    end

  end

  describe LoggedResponse, ".find_todays_responses" do
    before :each do
      @yesterday = LoggedResponse.new valid_params({ 'created_at' => (DateTime.now-1) })
      @yesterday.save
      LoggedResponse.create valid_params
    end

    it "only return today's responses" do
      LoggedResponse.find_todays_responses.size.should == 1
    end

    it "should not return yesterday's responses" do
      LoggedResponse.find_todays_responses.should_not include @yesterday
    end

    it "should include today's responses" do
      today = LoggedResponse.create valid_params
      LoggedResponse.find_todays_responses.size.should == 2
      LoggedResponse.find_todays_responses.should include today
    end
  end


end

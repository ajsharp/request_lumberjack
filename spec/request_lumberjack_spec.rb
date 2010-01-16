require 'spec_helper'
require 'action_controller'

describe RequestLumberjack::App, "#call" do
  before :each do
    response = get_rails_response
    @env = lambda { |env| [200, {}, response] }
    @rl = RequestLumberjack::App.new(@env)
  end

  it "should respond to call" do
    @rl.should respond_to(:call)
  end

  it "should return an array" do
    @rl.call([]).should be_instance_of Array
  end

  it "should return a status code in the first element" do
    @rl.call([]).first.should be_instance_of Fixnum
  end
end

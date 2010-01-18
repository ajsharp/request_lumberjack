require 'spec_helper'

describe RequestLumberjack::App, "#call" do
  before :each do
    response = get_rails_response
    @env = lambda { |env| [200, {}, response] }
    @rl = RequestLumberjack::App.new(@env)
  end

end

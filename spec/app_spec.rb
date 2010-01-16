require 'spec_helper'

module RequestLumberjack

  describe App do
    it "should accept a configuration file path" do
      env = lambda { |env| [200, {}, "body"] }
      @app = App.new(env, :config => 'fixtures/database.yml')
    end
  end

end

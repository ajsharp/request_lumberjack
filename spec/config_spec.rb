require 'spec_helper'

module RequestLumberjack

  describe Config, ".database" do
    it "should return a sqlite3 database connection" do
      Config.database(nil).should be_instance_of DataMapper::Adapters::Sqlite3Adapter
    end
  end

end



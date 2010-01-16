require 'yaml'

module RequestLumberjack

  class Config
    def self.database(uri)
      @database ||= DataMapper.setup(:default, uri)
    end
  end

end

require 'dm-core'
require 'dm-validations'

module RequestLumberjack
  
  class LoggedResponse
    include DataMapper::Resource

    property :id,             Serial
    property :request_uri,    String,  :required => true
    property :status,         Integer, :required => true
    property :request_method, String,  :required => true
    property :extra_fields,   Json

    timestamps :created_at

    class << self
      def find_todays_responses
        all(:created_at.gt => beginning_of_day, 
            :created_at.lt => end_of_day, 
            :order => [:created_at.desc])
      end

      private
        def end_of_day
          DateTime.civil(now.year, now.month, now.day, 24)
        end

        def beginning_of_day
          DateTime.civil(now.year, now.month, now.day, 0)
        end

        def now
          lambda { DateTime.now }.call
        end

    end


  end

end

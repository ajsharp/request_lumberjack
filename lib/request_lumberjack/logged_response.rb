require 'dm-core'
require 'dm-validations'

module RequestLumberjack
  
  class LoggedResponse
    class InvalidArgumentError < StandardError; end
    
    include DataMapper::Resource

    property :id,             Serial
    property :request_uri,    String,  :required => true
    property :status,         Integer, :required => true
    property :request_method, String,  :required => true
    property :user_id,        Integer

    class << self
      def create_from_response_params(params)
        raise InvalidArgumentError unless params.is_a? Hash
        
        LoggedResponse.new(cleanse_params(params)).save
      end
      
      protected
        def cleanse_params(params)
          params.select {|k,v| ['status', 'request_method', 'request_uri'].include? k }
        end
    end

  end

end


module RequestLumberjack
  class LoggedResponse
    include DataMapper::Resource

    property :id,             Serial
    property :request_uri,    String,  :required => true
    property :status,         Integer, :required => true
    property :request_method, String,  :required => true
    property :user_id,        Integer

    class << self
      def create_from_rails_response(response)
        logged_request = LoggedResponse.create(
          :request_uri    => response.request.request_uri,
          :status         => response.status,
          :request_method => response.request.request_method
        )
      end

      def create_from_response(response)
        create_from_rails_response(response) if defined? Rails
      end
    end

  end

end
